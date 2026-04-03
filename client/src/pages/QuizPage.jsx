import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import './QuizPage.css';

export default function QuizPage() {
  const { id } = useParams();
  const navigate = useNavigate();
  const { authFetch } = useAuth();
  const [questions, setQuestions] = useState([]);
  const [lessonTitle, setLessonTitle] = useState('');
  const [lessonOrder, setLessonOrder] = useState('');
  const [current, setCurrent] = useState(0);
  const [answers, setAnswers] = useState({});
  const [selected, setSelected] = useState(null);
  const [submitted, setSubmitted] = useState(false);
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    Promise.all([
      authFetch(`/api/quiz/${id}`).then((r) => r.json()),
      authFetch(`/api/lessons/${id}`).then((r) => r.json()),
    ]).then(([qs, lesson]) => {
      setQuestions(qs);
      setLessonTitle(lesson.title);
      setLessonOrder(lesson.order);
    }).finally(() => setLoading(false));
  }, [id]);

  if (loading) return <div className="loading-screen">Loading quiz…</div>;
  if (!questions.length) return <div className="loading-screen">No questions found.</div>;

  const q = questions[current];
  const total = questions.length;
  const options = Array.isArray(q.options) ? q.options : JSON.parse(q.options);

  const handleSelect = (opt) => {
    if (submitted) return;
    setSelected(opt);
    setAnswers({ ...answers, [q.id]: opt });
  };

  const handleNext = () => {
    if (current < total - 1) {
      setCurrent(current + 1);
      setSelected(answers[questions[current + 1]?.id] || null);
    } else {
      handleSubmit();
    }
  };

  const handleSubmit = async () => {
    const payload = questions.map((qu) => ({
      questionId: qu.id,
      selectedOption: answers[qu.id] || '',
    }));
    try {
      const res = await authFetch(`/api/quiz/${id}/submit`, {
        method: 'POST',
        body: JSON.stringify({ answers: payload }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || 'Submission failed');
      setResult(data);
      setSubmitted(true);
    } catch (err) {
      alert('Quiz submission failed: ' + err.message);
    }
  };

  if (submitted && result) {
    return (
      <div className="quiz-page">
        <div className="quiz-inner">
          <button className="back-link" onClick={() => navigate('/lessons')}>← Back to Lessons</button>
          <div className="quiz-result-card">
            <div className="result-score-circle" style={{ '--score': result.scorePct }}>
              <span className="result-pct">{result.scorePct}%</span>
            </div>
            <h2 className="result-title">
              {result.scorePct >= 80 ? '🎉 Excellent!' : result.scorePct >= 50 ? '👍 Good job!' : '📚 Keep practicing!'}
            </h2>
            <p className="result-detail">
              {result.correct} of {result.total} correct &nbsp;·&nbsp; +{result.pointsAwarded} points
            </p>
            <div className="result-btns">
              <button className="btn-secondary" onClick={() => { setSubmitted(false); setResult(null); setCurrent(0); setAnswers({}); setSelected(null); }}>
                Retry Quiz
              </button>
              <button className="btn-primary" onClick={() => navigate('/lessons')}>
                Back to Lessons
              </button>
            </div>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="quiz-page">
      <div className="quiz-inner">
        <div className="quiz-breadcrumb">Lesson {lessonOrder}: {lessonTitle} — Quiz</div>

        <div className="quiz-header-row">
          <span className="quiz-q-label">Question {current + 1} of {total}</span>
          <div className="dot-track">
            {questions.map((_, i) => (
              <div key={i} className={`dot ${i === current ? 'active' : i < current ? 'done' : ''}`} />
            ))}
          </div>
        </div>

        <div className="quiz-card">
          <h2 className="quiz-question" dangerouslySetInnerHTML={{
            __html: q.prompt.replace(/'([^']+)'/g, '<span class="quiz-term">"$1"</span>')
          }} />

          <div className="quiz-options">
            {options.map((opt) => (
              <button
                key={opt}
                className={`quiz-option ${selected === opt ? 'selected' : ''}`}
                onClick={() => handleSelect(opt)}
              >
                {opt}
              </button>
            ))}
          </div>
        </div>

        <div className="quiz-footer">
          <button
            className="btn-primary quiz-next"
            onClick={handleNext}
            disabled={!selected}
          >
            {current === total - 1 ? 'Submit Quiz' : 'Next →'}
          </button>
        </div>
      </div>
    </div>
  );
}
