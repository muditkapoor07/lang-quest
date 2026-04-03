const router = require('express').Router();
const pool = require('../db');
const authMiddleware = require('../middleware/auth');

router.get('/', authMiddleware, async (req, res) => {
  try {
    // Only show users who have selected a language in Lang-Quest
    const result = await pool.query(
      `SELECT u.id, u.name, u.total_points,
              RANK() OVER (ORDER BY u.total_points DESC) AS rank
       FROM users u
       INNER JOIN user_language ul ON ul.user_id = u.id
       ORDER BY u.total_points DESC
       LIMIT 50`
    );
    const rows = result.rows.map((r) => ({
      ...r,
      isCurrentUser: r.id === req.userId,
    }));
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
