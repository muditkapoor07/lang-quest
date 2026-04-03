require('dotenv').config({ path: require('path').join(__dirname, '../../.env') });
const fs = require('fs');
const path = require('path');
const pool = require('./index');

async function init() {
  const client = await pool.connect();
  try {
    console.log('Creating tables...');
    const schema = fs.readFileSync(path.join(__dirname, 'schema.sql'), 'utf8');
    await client.query(schema);
    console.log('Tables created.');

    console.log('Seeding data...');
    const seed = fs.readFileSync(path.join(__dirname, 'seed.sql'), 'utf8');
    await client.query(seed);
    console.log('Seed complete.');
  } catch (err) {
    console.error('Init error:', err.message);
    process.exit(1);
  } finally {
    client.release();
    await pool.end();
  }
}

init();
