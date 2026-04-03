const router = require('express').Router();
const pool = require('../db');
const authMiddleware = require('../middleware/auth');

router.get('/', authMiddleware, async (req, res) => {
  try {
    const userId = req.userId;

    // User + language
    const userResult = await pool.query(
      `SELECT u.total_points, ul.language_id, l.name AS language_name, l.flag_emoji
       FROM users u
       LEFT JOIN user_language ul ON ul.user_id = u.id
       LEFT JOIN languages l ON l.id = ul.language_id
       WHERE u.id = $1`,
      [userId]
    );
    if (!userResult.rows.length) return res.status(404).json({ error: 'User not found' });
    const user = userResult.rows[0];

    // Streak
    const streakResult = await pool.query(
      'SELECT current_streak, longest_streak, last_active_date FROM user_streaks WHERE user_id=$1',
      [userId]
    );
    const streak = streakResult.rows[0] || { current_streak: 0, longest_streak: 0 };

    // Lessons progress
    let totalLessons = 0;
    let lessonsCompleted = 0;
    if (user.language_id) {
      const totalResult = await pool.query(
        'SELECT COUNT(*) FROM lessons WHERE language_id=$1',
        [user.language_id]
      );
      totalLessons = parseInt(totalResult.rows[0].count);

      const completedResult = await pool.query(
        `SELECT COUNT(*) FROM user_lesson_progress ulp
         JOIN lessons l ON l.id = ulp.lesson_id
         WHERE ulp.user_id=$1 AND ulp.completed=true AND l.language_id=$2`,
        [userId, user.language_id]
      );
      lessonsCompleted = parseInt(completedResult.rows[0].count);
    }

    // Quiz stats
    const quizResult = await pool.query(
      `SELECT COUNT(DISTINCT lesson_id) AS quizzes_taken,
              COALESCE(AVG(score_pct), 0) AS avg_score
       FROM user_quiz_attempts WHERE user_id=$1`,
      [userId]
    );
    const quizStats = quizResult.rows[0];

    res.json({
      totalPoints: user.total_points,
      languageName: user.language_name,
      flagEmoji: user.flag_emoji,
      currentStreak: streak.current_streak,
      longestStreak: streak.longest_streak,
      lessonsCompleted,
      totalLessons,
      quizzesTaken: parseInt(quizStats.quizzes_taken),
      avgQuizScore: Math.round(parseFloat(quizStats.avg_score)),
      courseCompletion: totalLessons > 0 ? Math.round((lessonsCompleted / totalLessons) * 100) : 0,
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
