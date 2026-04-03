const router = require('express').Router();
const pool = require('../db');
const authMiddleware = require('../middleware/auth');

// Get selected language
router.get('/language', authMiddleware, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT ul.language_id, l.name, l.code, l.flag_emoji
       FROM user_language ul
       JOIN languages l ON l.id = ul.language_id
       WHERE ul.user_id = $1`,
      [req.userId]
    );
    if (!result.rows.length) return res.json(null);
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Set / change language
router.post('/language', authMiddleware, async (req, res) => {
  const { languageId } = req.body;
  if (!languageId) return res.status(400).json({ error: 'languageId required' });
  try {
    await pool.query(
      `INSERT INTO user_language (user_id, language_id, selected_at)
       VALUES ($1, $2, NOW())
       ON CONFLICT (user_id) DO UPDATE SET language_id=$2, selected_at=NOW()`,
      [req.userId, languageId]
    );
    res.json({ message: 'Language updated' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
