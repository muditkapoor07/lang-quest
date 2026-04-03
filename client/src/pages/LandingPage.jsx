import React from 'react';
import { useNavigate } from 'react-router-dom';
import './LandingPage.css';

export default function LandingPage() {
  const navigate = useNavigate();

  return (
    <div className="landing">
      <div className="landing-hero">
        <div className="landing-icon">
          <svg width="28" height="28" viewBox="0 0 24 24" fill="none">
            <path d="M12 2L13.9 8.26L20.66 8.27L15.12 12.14L17.02 18.37L12 14.9L6.98 18.37L8.88 12.14L3.34 8.27L10.1 8.26L12 2Z"
              fill="white" />
          </svg>
        </div>

        <h1 className="landing-title">Lang-Quest</h1>
        <p className="landing-tagline">
          Master new languages with interactive flashcards, quizzes,<br />
          and compete with learners worldwide.
        </p>

        <button className="landing-cta" onClick={() => navigate('/signup')}>
          Get Started &nbsp;→
        </button>

        <div className="landing-features">
          <span className="feature-pill">
            <svg width="14" height="14" fill="none" viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 016.5 17H20" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 014 19.5v-15A2.5 2.5 0 016.5 2z" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/></svg>
            5 Languages
          </span>
          <span className="feature-pill">
            <svg width="14" height="14" fill="none" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="2"/><polyline points="12 6 12 12 16 14" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/></svg>
            Interactive Quizzes
          </span>
          <span className="feature-pill">
            <svg width="14" height="14" fill="none" viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/><circle cx="9" cy="7" r="4" stroke="currentColor" strokeWidth="2"/><path d="M23 21v-2a4 4 0 00-3-3.87" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/><path d="M16 3.13a4 4 0 010 7.75" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/></svg>
            Leaderboard
          </span>
        </div>
      </div>

      <p className="landing-signin">
        Already have an account?{' '}
        <button className="link-btn" onClick={() => navigate('/login')}>Sign in</button>
      </p>
    </div>
  );
}
