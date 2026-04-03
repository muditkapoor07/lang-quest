import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import './LanguageSelectPage.css';

export default function LanguageSelectPage() {
  const { authFetch, updateUser } = useAuth();
  const navigate = useNavigate();
  const [languages, setLanguages] = useState([]);
  const [selected, setSelected] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  useEffect(() => {
    fetch('/api/languages')
      .then((r) => r.json())
      .then(setLanguages)
      .catch(() => setError('Failed to load languages'));
  }, []);

  const handleConfirm = async () => {
    if (!selected) return;
    setLoading(true);
    try {
      const res = await authFetch('/api/user/language', {
        method: 'POST',
        body: JSON.stringify({ languageId: selected }),
      });
      if (!res.ok) throw new Error('Failed to save language');

      // flushSync inside updateUser commits state synchronously before navigate fires
      const lang = languages.find((l) => l.id === selected);
      updateUser({
        language_id: selected,
        language_name: lang?.name,
        flag_emoji: lang?.flag_emoji,
      });

      navigate('/lessons', { replace: true });
    } catch (err) {
      setError(err.message || 'Failed to save. Please try again.');
      setLoading(false);
    }
  };

  return (
    <div className="lang-select-page">
      <div className="lang-select-card">
        <div className="lang-select-header">
          <div className="lang-select-icon">🌍</div>
          <h1>Choose Your Language</h1>
          <p>Select the language you want to learn</p>
        </div>

        {error && <div className="error-msg">{error}</div>}

        <div className="lang-grid">
          {languages.map((lang) => (
            <button
              key={lang.id}
              className={`lang-option ${selected === lang.id ? 'selected' : ''}`}
              onClick={() => setSelected(lang.id)}
            >
              <span className="lang-flag">{lang.flag_emoji}</span>
              <span className="lang-name">{lang.name}</span>
              {selected === lang.id && (
                <span className="lang-check">
                  <svg width="16" height="16" fill="none" viewBox="0 0 24 24">
                    <polyline points="20 6 9 17 4 12" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"/>
                  </svg>
                </span>
              )}
            </button>
          ))}
        </div>

        <button
          className="btn-primary lang-confirm"
          onClick={handleConfirm}
          disabled={!selected || loading}
        >
          {loading ? 'Saving…' : 'Start Learning →'}
        </button>
      </div>
    </div>
  );
}
