import React, { createContext, useContext, useState, useEffect } from 'react';
import { flushSync } from 'react-dom';

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const token = localStorage.getItem('token');
    if (token) {
      fetch('/api/auth/me', { headers: { Authorization: `Bearer ${token}` } })
        .then((r) => r.json())
        .then((data) => {
          if (data.user) setUser(data.user);
          else localStorage.removeItem('token');
        })
        .catch(() => localStorage.removeItem('token'))
        .finally(() => setLoading(false));
    } else {
      setLoading(false);
    }
  }, []);

  const login = (token, userData) => {
    localStorage.setItem('token', token);
    setUser(userData);
  };

  const logout = () => {
    localStorage.removeItem('token');
    setUser(null);
  };

  // Synchronously merge updates into user state so navigation sees the new values immediately
  const updateUser = (updates) => {
    flushSync(() => setUser((prev) => (prev ? { ...prev, ...updates } : prev)));
  };

  const refreshUser = async () => {
    const token = localStorage.getItem('token');
    if (!token) return;
    const r = await fetch('/api/auth/me', { headers: { Authorization: `Bearer ${token}` } });
    const data = await r.json();
    if (data.user) setUser(data.user);
  };

  const authFetch = (url, options = {}) => {
    const token = localStorage.getItem('token');
    return fetch(url, {
      ...options,
      headers: {
        'Content-Type': 'application/json',
        ...(options.headers || {}),
        Authorization: `Bearer ${token}`,
      },
    });
  };

  return (
    <AuthContext.Provider value={{ user, loading, login, logout, updateUser, refreshUser, authFetch }}>
      {children}
    </AuthContext.Provider>
  );
}

export const useAuth = () => useContext(AuthContext);
