-- Add missing column to existing users table (safe to run multiple times)
ALTER TABLE users ADD COLUMN IF NOT EXISTS total_points INTEGER DEFAULT 0;
ALTER TABLE users ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT NOW();

-- Set total_points to 0 for any existing users that have NULL
UPDATE users SET total_points = 0 WHERE total_points IS NULL;
