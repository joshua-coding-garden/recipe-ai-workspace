import { useAuthStore } from "../store/authStore";
import { login, register, getMe } from "../api/authApi";
import { useNavigate } from "react-router-dom";

export function useAuth() {
  const { token, user, setAuth, clearAuth } = useAuthStore();
  const navigate = useNavigate();

  async function handleLogin(email, password) {
    const data = await login(email, password);
    setAuth(data.access_token, data.user);
    navigate("/");
  }

  async function handleRegister(email, password, username) {
    const data = await register(email, password, username);
    setAuth(data.access_token, data.user);
    navigate("/");
  }

  async function handleLogout() {
    clearAuth();
    navigate("/login");
  }

  async function refreshUser() {
    if (!token) return;
    try {
      const userData = await getMe();
      useAuthStore.getState().setAuth(token, userData);
    } catch {
      clearAuth();
      navigate("/login");
    }
  }

  return {
    token,
    user,
    isAuthenticated: !!token,
    login: handleLogin,
    register: handleRegister,
    logout: handleLogout,
    refreshUser,
  };
}
