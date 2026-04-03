CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  total_points INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS languages (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  code VARCHAR(10) NOT NULL,
  flag_emoji VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS lessons (
  id SERIAL PRIMARY KEY,
  language_id INTEGER REFERENCES languages(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  "order" INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS vocab_items (
  id SERIAL PRIMARY KEY,
  lesson_id INTEGER REFERENCES lessons(id) ON DELETE CASCADE,
  term VARCHAR(255) NOT NULL,
  translation VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS quiz_questions (
  id SERIAL PRIMARY KEY,
  lesson_id INTEGER REFERENCES lessons(id) ON DELETE CASCADE,
  prompt VARCHAR(500) NOT NULL,
  correct_option VARCHAR(255) NOT NULL,
  options JSONB NOT NULL
);

CREATE TABLE IF NOT EXISTS user_language (
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE PRIMARY KEY,
  language_id INTEGER REFERENCES languages(id) ON DELETE CASCADE,
  selected_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS user_lesson_progress (
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  lesson_id INTEGER REFERENCES lessons(id) ON DELETE CASCADE,
  completed BOOLEAN DEFAULT FALSE,
  completed_at TIMESTAMP,
  PRIMARY KEY (user_id, lesson_id)
);

CREATE TABLE IF NOT EXISTS user_quiz_attempts (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  lesson_id INTEGER REFERENCES lessons(id) ON DELETE CASCADE,
  score_pct DECIMAL(5,2),
  correct_count INTEGER,
  total_count INTEGER,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS user_streaks (
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE PRIMARY KEY,
  current_streak INTEGER DEFAULT 0,
  longest_streak INTEGER DEFAULT 0,
  last_active_date DATE
);
