import theme from "../../utils/theme";
import Navbar from "./Navbar";

export default function Layout({ children }) {
  return (
    <div style={{ minHeight: "100vh", background: theme.bg, color: theme.text }}>
      <Navbar />
      <main style={{ padding: "24px", maxWidth: "1100px", margin: "0 auto" }}>
        {children}
      </main>
    </div>
  );
}
