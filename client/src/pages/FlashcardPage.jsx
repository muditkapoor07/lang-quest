import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
// lesson.flag_emoji comes from the joined language via the API
import './FlashcardPage.css';

export default function FlashcardPage() {
  const { id } = useParams();
  const navigate = useNavigate();
  const { authFetch } = useAuth();
  const [lesson, setLesson] = useState(null);
  const [index, setIndex] = useState(0);
  const [flipped, setFlipped] = useState(false);
  const [completing, setCompleting] = useState(false);
  const [done, setDone] = useState(false);

  useEffect(() => {
    authFetch(`/api/lessons/${id}`)
      .then((r) => r.json())
      .then(setLesson);
  }, [id]);

  if (!lesson) return <div className="loading-screen">Loading…</div>;

  const vocab = lesson.vocabItems || [];
  const card = vocab[index];
  const total = vocab.length;

  const handleNext = () => {
    if (index < total - 1) {
      setIndex(index + 1);
      setFlipped(false);
    } else {
      setDone(true);
    }
  };

  const handlePrev = () => {
    if (index > 0) {
      setIndex(index - 1);
      setFlipped(false);
    }
  };

  const handleFinish = async () => {
    setCompleting(true);
    try {
      await authFetch(`/api/lessons/${id}/complete`, { method: 'POST' });
      navigate(`/lessons/${id}/quiz`);
    } finally {
      setCompleting(false);
    }
  };

  return (
    <div className="flashcard-page">
      <div className="flashcard-page-inner">
        <button className="back-link" onClick={() => navigate('/lessons')}>
          ← Back to Lessons
        </button>

        <div className="flashcard-lesson-info">
          <div className="flashcard-lesson-num">Lesson {lesson.order}</div>
          <h2 className="flashcard-lesson-title">
            {lesson.flag_emoji || ''} {lesson.title}
          </h2>
          <p className="flashcard-lesson-sub">Learn all {total} words, then take the quiz</p>
        </div>

        {/* Dot progress */}
        <div className="dot-track">
          {vocab.map((_, i) => (
            <div
              key={i}
              className={`dot ${i === index ? 'active' : i < index ? 'done' : ''}`}
            />
          ))}
        </div>

        {/* Card */}
        {!done ? (
          <>
            <div
              className={`flashcard ${flipped ? 'flipped' : ''}`}
              onClick={() => setFlipped(!flipped)}
            >
              <div className="flashcard-inner">
                <div className="flashcard-front">
                  <p className="flashcard-label">TERM</p>
                  <h2 className="flashcard-word">{card.term}</h2>
                  <p className="flashcard-hint">
                    <svg width="16" height="16" fill="none" viewBox="0 0 24 24">
                      <path d="M1 4v6h6" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                      <path d="M23 20v-6h-6" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                      <path d="M20.49 9A9 9 0 005.64 5.64L1 10M23 14l-4.64 4.36A9 9 0 013.51 15" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                    </svg>
                    Tap to flip
                  </p>
                </div>
                <div className="flashcard-back">
                  <p className="flashcard-label">TRANSLATION</p>
                  <h2 className="flashcard-word">{card.translation}</h2>
                  <p className="flashcard-hint">
                    <svg width="16" height="16" fill="none" viewBox="0 0 24 24">
                      <path d="M1 4v6h6" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                      <path d="M23 20v-6h-6" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                      <path d="M20.49 9A9 9 0 005.64 5.64L1 10M23 14l-4.64 4.36A9 9 0 013.51 15" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                    </svg>
                    Tap to flip back
                  </p>
                </div>
              </div>
            </div>

            <div className="flashcard-nav">
              <button className="btn-secondary fc-nav-btn" onClick={handlePrev} disabled={index === 0}>
                ‹ Previous
              </button>
              <span className="fc-counter">{index + 1} / {total}</span>
              <button className="btn-primary fc-nav-btn" onClick={handleNext}>
                {index === total - 1 ? 'Finish' : 'Next ›'}
              </button>
            </div>
          </>
        ) : (
          <div className="flashcard-complete">
            <div className="complete-emoji">🎉</div>
            <h3>All {total} words reviewed!</h3>
            <p>Ready to take the quiz?</p>
            <div className="complete-btns">
              <button className="btn-secondary" onClick={() => { setDone(false); setIndex(0); setFlipped(false); }}>
                Review Again
              </button>
              <button className="btn-primary" onClick={handleFinish} disabled={completing}>
                {completing ? 'Saving…' : 'Take Quiz →'}
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
