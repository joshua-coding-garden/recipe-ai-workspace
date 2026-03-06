import { Link, useNavigate } from "react-router-dom";
import useAuthStore from "../../store/authStore";
import theme from "../../utils/theme";

export default function Navbar() {
  const { user, clearAuth } = useAuthStore();
  const navigate = useNavigate();

  const handleLogout = () => {
    clearAuth();
    navigate("/login");
  };

  return (
    <nav style={styles.nav}>
      <Link to="/" style={styles.brand}>運動員營養分析</Link>
      <div style={styles.links}>
        <Link to="/advisor" style={{...styles.link, fontWeight: "bold", color: "#ffd43b"}}>🤖 AI 顧問</Link>
        <Link to="/analysis" style={styles.link}>整合分析</Link>
        <Link to="/recipes" style={styles.link}>我的食譜</Link>
        <Link to="/calendar" style={styles.link}>日分析行事曆</Link>
        <Link to="/food-search" style={styles.link}>食物搜尋</Link>
        <Link to="/food-database" style={styles.link}>食物資料庫</Link>
        <Link to="/nutrient-ranking" style={styles.link}>營養素排名</Link>
        <Link to="/symptom-search" style={styles.link}>症狀搜尋</Link>
        <Link to="/synonym-dict" style={styles.link}>同義詞辭典</Link>
        <Link to="/stopwords" style={styles.link}>停用詞</Link>
        <Link to="/dri-gap" style={styles.link}>DRI 分析</Link>
        <Link to="/graphrag" style={styles.link}>GraphRAG</Link>
        <Link to="/literature-review" style={styles.link}>文獻回顧</Link>
        <Link to="/profile" style={styles.link}>個人資料</Link>
        {user ? (
          <button onClick={handleLogout} style={styles.btn}>登出</button>
        ) : (
          <Link to="/login" style={styles.link}>登入</Link>
        )}
      </div>
    </nav>
  );
}

const styles = {
  nav: { display:"flex", justifyContent:"space-between", alignItems:"center",
        padding:"12px 24px", background: theme.navBg, color:"#fff" },
  brand: { color:"#fff", fontWeight:"bold", fontSize:"18px", textDecoration:"none" },
  links: { display:"flex", gap:"16px", alignItems:"center" },
  link: { color:"#fff", textDecoration:"none", fontSize:"14px" },
  btn: { background:"transparent", border:"1px solid #fff", color:"#fff",
         padding:"4px 12px", borderRadius:"4px", cursor:"pointer", fontSize:"14px" },
};
