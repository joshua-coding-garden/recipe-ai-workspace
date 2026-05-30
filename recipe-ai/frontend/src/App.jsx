import { lazy, Suspense, Component } from "react";
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import Layout from "./components/layout/Layout";
import useAuthStore from "./store/authStore";

const LoginPage = lazy(() => import("./pages/LoginPage"));
const RegisterPage = lazy(() => import("./pages/RegisterPage"));
const FoodSearchPage = lazy(() => import("./pages/FoodSearchPage"));
const ProfilePage = lazy(() => import("./pages/ProfilePage"));
const SavedRecipesPage = lazy(() => import("./pages/SavedRecipesPage"));
const TaiwanFoodDatabasePage = lazy(() => import("./pages/TaiwanFoodDatabasePage"));
const SymptomSearchPage = lazy(() => import("./pages/SymptomSearchPage"));
const SynonymDictPage = lazy(() => import("./pages/SynonymDictPage"));
const DriGapPage = lazy(() => import("./pages/DriGapPage"));
const UnifiedAnalysisPage = lazy(() => import("./pages/UnifiedAnalysisPage"));
const StopwordsPage = lazy(() => import("./pages/StopwordsPage"));
const NutrientRankingPage = lazy(() => import("./pages/NutrientRankingPage"));
const DailyAnalysisCalendarPage = lazy(() => import("./pages/DailyAnalysisCalendarPage"));
const GraphRAGPage = lazy(() => import("./pages/GraphRAGPage"));
const LiteratureReviewPage = lazy(() => import("./pages/LiteratureReviewPage"));
const PdfViewerPage = lazy(() => import("./pages/PdfViewerPage"));
const AdvisorPage = lazy(() => import("./pages/AdvisorPage"));

class ErrorBoundary extends Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false, error: null };
  }
  static getDerivedStateFromError(error) {
    return { hasError: true, error };
  }
  render() {
    if (this.state.hasError) {
      return (
        <div style={{ padding: "2rem", textAlign: "center" }}>
          <h2>發生錯誤</h2>
          <p>{this.state.error?.message}</p>
          <button onClick={() => window.location.reload()}>重新載入</button>
        </div>
      );
    }
    return this.props.children;
  }
}

function PrivateRoute({ children }) {
  const { token, clearAuth } = useAuthStore();
  if (!token) return <Navigate to="/login" replace />;
  try {
    const payload = JSON.parse(atob(token.split(".")[1]));
    if (payload.exp && payload.exp * 1000 < Date.now()) {
      clearAuth();
      return <Navigate to="/login" replace />;
    }
  } catch {
    clearAuth();
    return <Navigate to="/login" replace />;
  }
  return children;
}

const Loading = () => (
  <div style={{ display: "flex", justifyContent: "center", alignItems: "center", height: "60vh" }}>
    載入中...
  </div>
);

export default function App() {
  return (
    <ErrorBoundary>
      <BrowserRouter>
        <Suspense fallback={<Loading />}>
          <Routes>
            <Route path="/login"    element={<LoginPage />} />
            <Route path="/register" element={<RegisterPage />} />
            <Route path="/pdf-viewer" element={<PdfViewerPage />} />
            <Route path="/" element={<Navigate to="/advisor" replace />} />
            <Route
              path="/advisor"
              element={
                <PrivateRoute>
                  <Layout><AdvisorPage /></Layout>
                </PrivateRoute>
              }
            />
            <Route
              path="/food-search"
              element={
                <PrivateRoute>
                  <Layout><FoodSearchPage /></Layout>
                </PrivateRoute>
              }
            />
            <Route
              path="/profile"
              element={
                <PrivateRoute>
                  <Layout><ProfilePage /></Layout>
                </PrivateRoute>
              }
            />
            <Route
              path="/recipes"
              element={
                <PrivateRoute>
                  <Layout><SavedRecipesPage /></Layout>
                </PrivateRoute>
              }
            />
            <Route
              path="/food-database"
              element={
                <PrivateRoute>
                  <Layout><TaiwanFoodDatabasePage /></Layout>
                </PrivateRoute>
              }
            />
            <Route
              path="/symptom-search"
              element={
                <PrivateRoute>
                  <Layout><SymptomSearchPage /></Layout>
                </PrivateRoute>
              }
            />
            <Route
              path="/synonym-dict"
              element={
                <PrivateRoute>
                  <Layout><SynonymDictPage /></Layout>
                </PrivateRoute>
              }
            />
            <Route
              path="/dri-gap"
              element={
                <PrivateRoute>
                  <Layout><DriGapPage /></Layout>
                </PrivateRoute>
              }
            />
            <Route
              path="/analysis"
              element={
                <PrivateRoute>
                  <Layout><UnifiedAnalysisPage /></Layout>
                </PrivateRoute>
              }
            />
            <Route
              path="/stopwords"
              element={
                <PrivateRoute>
                  <Layout><StopwordsPage /></Layout>
                </PrivateRoute>
              }
            />
            <Route
              path="/nutrient-ranking"
              element={
                <PrivateRoute>
                  <Layout><NutrientRankingPage /></Layout>
                </PrivateRoute>
              }
            />
            <Route
              path="/calendar"
              element={
                <PrivateRoute>
                  <Layout><DailyAnalysisCalendarPage /></Layout>
                </PrivateRoute>
              }
            />
            <Route
              path="/graphrag"
              element={
                <PrivateRoute>
                  <Layout><GraphRAGPage /></Layout>
                </PrivateRoute>
              }
            />
            <Route
              path="/literature-review"
              element={
                <PrivateRoute>
                  <Layout><LiteratureReviewPage /></Layout>
                </PrivateRoute>
              }
            />
          </Routes>
        </Suspense>
      </BrowserRouter>
    </ErrorBoundary>
  );
}
