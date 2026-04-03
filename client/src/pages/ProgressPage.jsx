import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import './ProgressPage.css';

export default function ProgressPage() {
  const { authFetch } = useAuth();
  const navigate = useNavigate();
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    authFetch('/api/progress')
      .then((r) => r.json())
      .then((data) => { if (data && !data.error) setData(data); })
      .finally(() => setLoading(false));
  }, []);

  if (loading) return <div className="loading-screen">Loading…</div>;
  if (!data) return <div className="loading-screen">Failed to load progress.</div>;

  return (
    <div className="page-container">
      <button className="back-link" onClick={() => navigate('/lessons')}>← Back</button>

      <h1 className="progress-title">Your Progress</h1>
      <p className="progress-subtitle">
        Learning {data.flagEmoji} {data.languageName}
      </p>

      {/* Streak banner */}
      <div className="streak-banner">
        <div className="streak-left">
          <div className="streak-flame">🔥</div>
          <div>
            <div className="streak-label">Current Streak</div>
            <div className="streak-value">{data.currentStreak} day{data.currentStreak !== 1 ? 's' : ''}</div>
          </div>
        </div>
        <div className="streak-longest">
          Longest Streak: <strong>{data.longestStreak} day{data.longestStreak !== 1 ? 's' : ''}</strong>
        </div>
      </div>

      {/* Stats grid */}
      <div className="stats-grid">
        <div className="stat-card">
          <div className="stat-icon stat-icon-purple">
            <svg width="20" height="20" fill="none" viewBox="0 0 24 24">
              <circle cx="12" cy="12" r="8" stroke="currentColor" strokeWidth="2"/>
              <path d="M12 8v4l3 3" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
            </svg>
          </div>
          <div>
            <div className="stat-label">TOTAL POINTS</div>
            <div className="stat-value">{data.totalPoints}</div>
          </div>
        </div>

        <div className="stat-card">
          <div className="stat-icon stat-icon-green">
            <svg width="20" height="20" fill="none" viewBox="0 0 24 24">
              <path d="M4 19.5A2.5 2.5 0 016.5 17H20" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
              <path d="M6.5 2H20v20H6.5A2.5 2.5 0 014 19.5v-15A2.5 2.5 0 016.5 2z" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
            </svg>
          </div>
          <div>
            <div className="stat-label">LESSONS DONE</div>
            <div className="stat-value">{data.lessonsCompleted}/{data.totalLessons}</div>
          </div>
        </div>

        <div className="stat-card">
          <div className="stat-icon stat-icon-blue">
            <svg width="20" height="20" fill="none" viewBox="0 0 24 24">
              <polyline points="22 12 18 12 15 21 9 3 6 12 2 12" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
            </svg>
          </div>
          <div>
            <div className="stat-label">AVG QUIZ SCORE</div>
            <div className="stat-value">{data.avgQuizScore}%</div>
          </div>
        </div>

        <div className="stat-card">
          <div className="stat-icon stat-icon-orange">
            <svg width="20" height="20" fill="none" viewBox="0 0 24 24">
              <path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
            </svg>
          </div>
          <div>
            <div className="stat-label">QUIZZES TAKEN</div>
            <div className="stat-value">{data.quizzesTaken}</div>
          </div>
        </div>
      </div>

      {/* Course completion */}
      <div className="completion-card">
        <h3 className="completion-title">Course Completion</h3>
        <div className="completion-bar-wrap">
          <div className="completion-bar">
            <div className="completion-fill" style={{ width: `${data.courseCompletion}%` }} />
          </div>
          <span className="completion-pct">{data.courseCompletion}%</span>
        </div>
        <p className="completion-sub">
          {data.lessonsCompleted} of {data.totalLessons} lessons completed
        </p>
      </div>
    </div>
  );
}
