import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import './LessonsPage.css';

export default function LessonsPage() {
  const { authFetch, user } = useAuth();
  const navigate = useNavigate();
  const [lessons, setLessons] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    authFetch('/api/lessons')
      .then((r) => r.json())
      .then(setLessons)
      .finally(() => setLoading(false));
  }, []);

  if (loading) return <div className="loading-screen">Loading lessons…</div>;

  const completed = lessons.filter((l) => l.completed).length;

  return (
    <div className="page-container">
      <div className="lessons-header">
        <div>
          <h1 className="lessons-title">Lessons</h1>
          <p className="lessons-subtitle">
            Learning {user?.flag_emoji} {user?.language_name} &nbsp;·&nbsp; {completed}/{lessons.length} completed
          </p>
        </div>
        <div className="lessons-progress-bar-wrap">
          <div className="lessons-progress-bar">
            <div
              className="lessons-progress-fill"
              style={{ width: lessons.length ? `${(completed / lessons.length) * 100}%` : '0%' }}
            />
          </div>
          <span className="lessons-pct">
            {lessons.length ? Math.round((completed / lessons.length) * 100) : 0}%
          </span>
        </div>
      </div>

      <div className="lesson-list">
        {lessons.map((lesson, idx) => {
          const isLocked = idx > 0 && !lessons[idx - 1].completed;
          return (
            <div key={lesson.id} className={`lesson-card ${lesson.completed ? 'done' : ''} ${isLocked ? 'locked' : ''}`}>
              <div className="lesson-order">Lesson {lesson.order}</div>
              <div className="lesson-info">
                <h3 className="lesson-title">{lesson.title}</h3>
                <p className="lesson-meta">
                  {lesson.completed ? '✓ Completed' : isLocked ? '🔒 Complete previous lesson first' : 'Tap to start'}
                  {lesson.quiz_attempts > 0 && ` · ${lesson.quiz_attempts} quiz attempt${lesson.quiz_attempts > 1 ? 's' : ''}`}
                </p>
              </div>
              <div className="lesson-actions">
                {!isLocked && (
                  <>
                    <button
                      className="btn-primary lesson-btn"
                      onClick={() => navigate(`/lessons/${lesson.id}`)}
                    >
                      {lesson.completed ? 'Review' : 'Start'}
                    </button>
                    {lesson.completed && (
                      <button
                        className="btn-secondary lesson-btn"
                        onClick={() => navigate(`/lessons/${lesson.id}/quiz`)}
                      >
                        Quiz
                      </button>
                    )}
                  </>
                )}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
