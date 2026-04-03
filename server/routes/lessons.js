const router = require('express').Router();
const pool = require('../db');
const authMiddleware = require('../middleware/auth');
const { updateStreak, awardPoints } = require('../utils/streak');

// Get lessons for user's selected language
router.get('/', authMiddleware, async (req, res) => {
  try {
    const langResult = await pool.query(
      'SELECT language_id FROM user_language WHERE user_id=$1',
      [req.userId]
    );
    if (!langResult.rows.length) return res.json([]);
    const languageId = langResult.rows[0].language_id;

    const result = await pool.query(
      `SELECT l.id, l.title, l."order",
              COALESCE(ulp.completed, false) AS completed,
              ulp.completed_at,
              COUNT(DISTINCT qa.id) AS quiz_attempts
       FROM lessons l
       LEFT JOIN user_lesson_progress ulp ON ulp.lesson_id = l.id AND ulp.user_id = $1
       LEFT JOIN user_quiz_attempts qa ON qa.lesson_id = l.id AND qa.user_id = $1
       WHERE l.language_id = $2
       GROUP BY l.id, l.title, l."order", ulp.completed, ulp.completed_at
       ORDER BY l."order"`,
      [req.userId, languageId]
    );
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Get lesson with vocab items
router.get('/:id', authMiddleware, async (req, res) => {
  try {
    const lesson = await pool.query(
      `SELECT l.*, lang.flag_emoji
       FROM lessons l
       JOIN languages lang ON lang.id = l.language_id
       WHERE l.id = $1`,
      [req.params.id]
    );
    if (!lesson.rows.length) return res.status(404).json({ error: 'Lesson not found' });

    const vocab = await pool.query(
      'SELECT id, term, translation FROM vocab_items WHERE lesson_id=$1 ORDER BY id',
      [req.params.id]
    );

    const progress = await pool.query(
      'SELECT completed FROM user_lesson_progress WHERE user_id=$1 AND lesson_id=$2',
      [req.userId, req.params.id]
    );

    res.json({
      ...lesson.rows[0],
      vocabItems: vocab.rows,
      completed: progress.rows[0]?.completed || false,
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Complete a lesson
router.post('/:id/complete', authMiddleware, async (req, res) => {
  const lessonId = req.params.id;
  try {
    const existing = await pool.query(
      'SELECT completed FROM user_lesson_progress WHERE user_id=$1 AND lesson_id=$2',
      [req.userId, lessonId]
    );

    let pointsAwarded = 0;
    if (!existing.rows.length || !existing.rows[0].completed) {
      await pool.query(
        `INSERT INTO user_lesson_progress (user_id, lesson_id, completed, completed_at)
         VALUES ($1, $2, true, NOW())
         ON CONFLICT (user_id, lesson_id) DO UPDATE SET completed=true, completed_at=NOW()`,
        [req.userId, lessonId]
      );
      pointsAwarded = 10;
    }

    // Send response immediately; run streak/points in background
    res.json({ message: 'Lesson completed', pointsAwarded });

    if (pointsAwarded > 0) {
      awardPoints(req.userId, pointsAwarded).catch((e) => console.error('awardPoints:', e.message));
    }
    updateStreak(req.userId).catch((e) => console.error('updateStreak:', e.message));
  } catch (err) {
    console.error('lesson complete error:', err.message);
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
