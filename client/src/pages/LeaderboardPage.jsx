import React, { useEffect, useState, useRef } from 'react';
import { useAuth } from '../contexts/AuthContext';
import './LeaderboardPage.css';

const MEDALS = ['🥇', '🥈', '🥉'];

export default function LeaderboardPage() {
  const { authFetch } = useAuth();
  const [rows, setRows] = useState([]);
  const [loading, setLoading] = useState(true);
  const currentRef = useRef(null);

  useEffect(() => {
    authFetch('/api/leaderboard')
      .then((r) => r.json())
      .then((data) => { if (Array.isArray(data)) setRows(data); })
      .finally(() => setLoading(false));
  }, []);

  useEffect(() => {
    if (currentRef.current) {
      currentRef.current.scrollIntoView({ behavior: 'smooth', block: 'center' });
    }
  }, [rows]);

  if (loading) return <div className="loading-screen">Loading…</div>;

  return (
    <div className="page-container">
      <div className="lb-header">
        <h1 className="lb-title">Leaderboard</h1>
        <p className="lb-subtitle">Top learners ranked by total points</p>
      </div>

      <div className="lb-table">
        <div className="lb-thead">
          <span>Rank</span>
          <span>Learner</span>
          <span className="lb-points-head">Points</span>
        </div>

        {rows.map((row) => {
          const medal = MEDALS[Number(row.rank) - 1];
          return (
            <div
              key={row.id}
              ref={row.isCurrentUser ? currentRef : null}
              className={`lb-row ${row.isCurrentUser ? 'current-user' : ''}`}
            >
              <span className="lb-rank">
                {medal || `#${row.rank}`}
              </span>
              <span className="lb-name">
                {row.name}
                {row.isCurrentUser && <span className="lb-you">You</span>}
              </span>
              <span className="lb-points">{row.total_points.toLocaleString()}</span>
            </div>
          );
        })}

        {rows.length === 0 && (
          <div className="lb-empty">No users yet. Complete lessons to earn points!</div>
        )}
      </div>
    </div>
  );
}
