require('dotenv').config({ path: require('path').join(__dirname, '../../.env') });
const fs = require('fs');
const path = require('path');
const pool = require('./index');

async function migrate(file) {
  const client = await pool.connect();
  try {
    const sql = fs.readFileSync(path.join(__dirname, file), 'utf8');
    await client.query(sql);
    console.log(`Migration complete: ${file}`);
  } catch (err) {
    console.error('Migration error:', err.message);
    process.exit(1);
  } finally {
    client.release();
    await pool.end();
  }
}

migrate(process.argv[2] || 'migrate_add_languages.sql');
