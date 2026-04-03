import React, { useState } from 'react';
import { NavLink, useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import './Navbar.css';

export default function Navbar() {
  const { user, logout } = useAuth();
  const navigate = useNavigate();
  const [menuOpen, setMenuOpen] = useState(false);

  const handleLogout = () => {
    logout();
    navigate('/');
  };

  const initial = user?.name?.[0]?.toUpperCase() || '?';

  return (
    <nav className="navbar">
      <div className="navbar-inner">
        <NavLink to="/lessons" className="navbar-brand">
          <div className="navbar-logo">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
              <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"
                fill="white" />
            </svg>
          </div>
          <span className="navbar-name">Lang-Quest</span>
        </NavLink>

        <div className="navbar-links">
          <NavLink to="/lessons" className={({ isActive }) => isActive ? 'nav-link active' : 'nav-link'}>
            <svg width="16" height="16" fill="none" viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/><polyline points="9 22 9 12 15 12 15 22" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/></svg>
            Home
          </NavLink>
          <NavLink to="/lessons" end={false} className={({ isActive }) => isActive ? 'nav-link active' : 'nav-link'}>
            <svg width="16" height="16" fill="none" viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 016.5 17H20" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 014 19.5v-15A2.5 2.5 0 016.5 2z" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/></svg>
            Lessons
          </NavLink>
          <NavLink to="/progress" className={({ isActive }) => isActive ? 'nav-link active' : 'nav-link'}>
            <svg width="16" height="16" fill="none" viewBox="0 0 24 24"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/></svg>
            Streaks
          </NavLink>
          <span className="nav-link nav-link-muted">
            <svg width="16" height="16" fill="none" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/></svg>
            Premium
          </span>
          <NavLink to="/progress" className={({ isActive }) => isActive ? 'nav-link active' : 'nav-link'}>
            <svg width="16" height="16" fill="none" viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/><line x1="12" y1="20" x2="12" y2="4" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/><line x1="6" y1="20" x2="6" y2="14" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/></svg>
            Progress
          </NavLink>
          <NavLink to="/leaderboard" className={({ isActive }) => isActive ? 'nav-link active' : 'nav-link'}>
            <svg width="16" height="16" fill="none" viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/><circle cx="9" cy="7" r="4" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/><path d="M23 21v-2a4 4 0 00-3-3.87" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/><path d="M16 3.13a4 4 0 010 7.75" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/></svg>
            Leaderboard
          </NavLink>
        </div>

        <div className="navbar-user" onClick={() => setMenuOpen(!menuOpen)}>
          <div className="user-avatar">{initial}</div>
          {menuOpen && (
            <div className="user-dropdown">
              <div className="dropdown-name">{user?.name}</div>
              <div className="dropdown-email">{user?.email}</div>
              <hr className="dropdown-divider" />
              <NavLink to="/select-language" className="dropdown-item" onClick={() => setMenuOpen(false)}>
                Change Language
              </NavLink>
              <button className="dropdown-item dropdown-logout" onClick={handleLogout}>
                Log out
              </button>
            </div>
          )}
        </div>
      </div>
    </nav>
  );
}
