const pool = require('../db');

async function updateStreak(userId) {
  // Do all date arithmetic in PostgreSQL to avoid Node.js timezone issues
  await pool.query(
    `INSERT INTO user_streaks (user_id, current_streak, longest_streak, last_active_date)
     VALUES ($1, 1, 1, CURRENT_DATE)
     ON CONFLICT (user_id) DO UPDATE SET
       current_streak = CASE
         WHEN user_streaks.last_active_date = CURRENT_DATE
           THEN user_streaks.current_streak                      -- same day, no change
         WHEN user_streaks.last_active_date = CURRENT_DATE - 1
           THEN user_streaks.current_streak + 1                  -- consecutive day
         ELSE 1                                                   -- streak broken
       END,
       longest_streak = GREATEST(
         user_streaks.longest_streak,
         CASE
           WHEN user_streaks.last_active_date = CURRENT_DATE
             THEN user_streaks.current_streak
           WHEN user_streaks.last_active_date = CURRENT_DATE - 1
             THEN user_streaks.current_streak + 1
           ELSE 1
         END
       ),
       last_active_date = CASE
         WHEN user_streaks.last_active_date < CURRENT_DATE THEN CURRENT_DATE
         ELSE user_streaks.last_active_date
       END`,
    [userId]
  );
}

async function awardPoints(userId, points) {
  if (!points || points <= 0) return;
  await pool.query(
    'UPDATE users SET total_points = total_points + $1 WHERE id = $2',
    [points, userId]
  );
}

module.exports = { updateStreak, awardPoints };
