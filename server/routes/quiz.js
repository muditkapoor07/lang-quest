const router = require('express').Router();
const pool = require('../db');
const authMiddleware = require('../middleware/auth');
const { updateStreak, awardPoints } = require('../utils/streak');

// Get quiz questions for a lesson (no correct answer exposed)
router.get('/:lessonId', authMiddleware, async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT id, prompt, options FROM quiz_questions WHERE lesson_id=$1 ORDER BY id',
      [req.params.lessonId]
    );
    res.json(result.rows);
  } catch (err) {
    console.error('GET quiz error:', err.message);
    res.status(500).json({ error: err.message });
  }
});

// Submit quiz answers
router.post('/:lessonId/submit', authMiddleware, async (req, res) => {
  const { answers } = req.body;
  const lessonId = req.params.lessonId;

  try {
    if (!Array.isArray(answers)) {
      return res.status(400).json({ error: 'answers must be an array' });
    }

    const qResult = await pool.query(
      'SELECT id, correct_option FROM quiz_questions WHERE lesson_id=$1',
      [lessonId]
    );
    const questions = qResult.rows;
    const total = questions.length;

    let correct = 0;
    for (const q of questions) {
      // q.id from pg is a number; a.questionId from client is also a number
      const answer = answers.find((a) => Number(a.questionId) === Number(q.id));
      if (answer && answer.selectedOption === q.correct_option) correct++;
    }

    const scorePct = total > 0 ? Math.round((correct / total) * 100) : 0;
    const pointsAwarded = correct * 5;

    await pool.query(
      `INSERT INTO user_quiz_attempts (user_id, lesson_id, score_pct, correct_count, total_count)
       VALUES ($1, $2, $3, $4, $5)`,
      [req.userId, lessonId, scorePct, correct, total]
    );

    // Send response immediately; run streak/points in background
    res.json({ scorePct, correct, total, pointsAwarded });

    awardPoints(req.userId, pointsAwarded).catch((e) => console.error('awardPoints:', e.message));
    updateStreak(req.userId).catch((e) => console.error('updateStreak:', e.message));
  } catch (err) {
    console.error('POST quiz/submit error:', err.message);
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
