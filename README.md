# 🌍 Lang-Quest

## 🧠 What This Project Does (Plain English)

Lang-Quest is a **language learning web app** — think Duolingo, but simpler and open source. It helps you learn vocabulary in a new language through interactive flashcards and multiple-choice quizzes, while tracking your progress and competing with other learners on a leaderboard.

Think of it as a tool that:

- Shows you vocabulary **flashcards** (click to flip and see the translation)
- Tests you with **multiple-choice quizzes** on what you've learned
- Tracks your **daily streak**, **points**, and **quiz scores**
- Lets you see how you rank against others on a **leaderboard**

---

## ✨ Key Features

🔹 **Flashcard Lessons** — Learn vocabulary word by word with a flip-card experience. See the word, guess the meaning, then flip to check.

🔹 **Multiple-Choice Quizzes** — After each lesson, take a 6-question quiz to test your memory. Get scored and earn points for correct answers.

🔹 **7 Languages** — Choose from French 🇫🇷, Spanish 🇪🇸, German 🇩🇪, Italian 🇮🇹, Japanese 🇯🇵, English 🇺🇸, and Hindi 🇮🇳.

🔹 **Points & Streaks** — Earn 10 points for completing a lesson and 5 points per correct quiz answer. Build a daily streak by learning every day.

🔹 **Progress Dashboard** — See your streak, total points, lessons completed, average quiz score, and course completion percentage all in one place.

🔹 **Leaderboard** — Compete with other learners ranked by total points.

🔹 **User Accounts** — Sign up, log in, and pick up right where you left off. Your progress is saved.

---

## ⚙️ How It Works

1. You **sign up** and choose a language to learn
2. You go through **lessons** (e.g. Colors, Numbers, Greetings) one at a time
3. Each lesson has **flashcards** — click each card to flip it and see the translation
4. After finishing the cards, you take a **quiz** — 6 multiple-choice questions
5. You earn **points** for correct answers and your **streak** grows each day you learn
6. Check the **Progress** page to see your stats and the **Leaderboard** to see your ranking

---

## 🚀 How to Use It

### Step 1: Setup

Clone the repository:

```bash
git clone https://github.com/muditkapoor07/lang-quest.git
cd lang-quest
```

Install all dependencies:

```bash
npm install
cd server && npm install && cd ..
cd client && npm install && cd ..
```

### Step 2: Configure Environment

Copy the example env file and fill in your values:

```bash
cp .env.example .env
```

Open `.env` and set:

```
DATABASE_URL=your_neon_postgresql_connection_string
JWT_SECRET=any_long_random_secret_string
PORT=5000
NODE_ENV=development
```

> You need a free [Neon](https://neon.tech) PostgreSQL database. Copy the connection string from your Neon dashboard.

### Step 3: Set Up the Database

Run this once to create all tables and load the lesson content:

```bash
npm run init-db
```

### Step 4: Run the App

```bash
npm run dev
```

Then open your browser at **http://localhost:5173**

---

## 🧩 Example Usage

1. Go to `http://localhost:5173`
2. Click **Get Started** and create an account
3. Choose **French** as your language
4. Open **Lesson 1 – Colors**
5. Click through the flashcards (e.g. "Rouge" → flip → "Red")
6. Click **Finish** to take the quiz
7. Answer 6 multiple-choice questions
8. See your score, points earned, and updated streak
9. Check **Progress** and **Leaderboard** in the top nav

**What you'll experience:**

- You input: clicking flashcards and selecting quiz answers
- The system tracks: points, streak, quiz scores
- You get: a progress dashboard and a rank on the leaderboard

---

## 🛠️ Configuration

Environment variables in your `.env` file:

| Variable | Description |
|----------|-------------|
| `DATABASE_URL` | Neon PostgreSQL connection string |
| `JWT_SECRET` | Secret key used to sign login tokens (make it long and random) |
| `PORT` | Port the server runs on (default: 5000) |
| `NODE_ENV` | Set to `development` locally, `production` on server |

---

## 📂 Project Structure

```
lang-quest/
├── client/                  # React frontend (Vite)
│   └── src/
│       ├── pages/           # One file per screen (Lessons, Quiz, Progress, etc.)
│       ├── components/      # Shared components (Navbar)
│       └── contexts/        # Auth state shared across the app
├── server/                  # Express backend (Node.js)
│   ├── routes/              # API endpoints (auth, lessons, quiz, progress...)
│   ├── db/                  # Database connection, schema, seed data
│   ├── middleware/          # JWT auth check
│   └── utils/               # Streak and points logic
├── .env.example             # Template for environment variables
├── render.yaml              # One-click deploy config for Render
└── package.json             # Root scripts to run everything together
```

---

## 💡 Who Is This For?

This project is useful for:

- **Language learners** who want a simple, no-fluff flashcard + quiz app
- **Developers** who want a full-stack Node.js + React project to learn from or build on
- **Students** looking for a real-world example of auth, databases, and REST APIs
- **Teams** wanting a deployable learning tool they can customise

---

## ☁️ Deploying to Render (Free)

1. Push this repo to GitHub
2. Go to [render.com](https://render.com) → New → Web Service
3. Connect your GitHub repo — Render auto-detects `render.yaml`
4. Add environment variables: `DATABASE_URL`, `JWT_SECRET`, `NODE_ENV=production`
5. Click **Deploy** — your app will be live in ~5 minutes

> **Note:** On Render's free tier, the app sleeps after 15 minutes of inactivity. The first visit after idle takes about 30 seconds to wake up.

---

## ⚠️ Notes

- Make sure you have **Node.js 18+** installed
- The database must be set up (`npm run init-db`) before the app will work
- All lesson content (vocabulary + quiz questions) is loaded automatically by the seed script
- The app uses JWT tokens stored in the browser — no cookies needed

---

## 📌 Summary

Lang-Quest helps you learn a new language by:

- Breaking vocabulary into small, focused lessons
- Reinforcing learning through quizzes and instant feedback
- Keeping you motivated with streaks, points, and a leaderboard
- Saving your progress so you can return anytime and continue

---

*Built with React, Node.js, Express, and PostgreSQL (Neon). Deployed on Render.*
