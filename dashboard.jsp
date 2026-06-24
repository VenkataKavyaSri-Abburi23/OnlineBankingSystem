<%@ page import="java.sql.*, com.bank.dao.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    Object uid = session.getAttribute("userId");
    if (uid == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Dashboard</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
  <header class="topbar">
  <h1>Online Banking</h1>
  <nav>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="profile.jsp">Profile</a>
    <a href="#" onclick="toggleDark()">🌙</a>
    <a href="#" onclick="confirmLogout(event)">Logout</a>
  </nav>
</header>


  <div id="toast" class="toast" style="display:none;"></div>

  <main>
    <% 
      int userId = (int) uid;
      String userName="User"; double balance=0;
      try (Connection con = DBConnection.getConnection();
           PreparedStatement ps = con.prepareStatement("SELECT name,balance FROM users WHERE id=?")) {
         ps.setInt(1,userId);
         try (ResultSet rs = ps.executeQuery()){ if(rs.next()){ userName = rs.getString("name"); balance = rs.getDouble("balance"); } }
      } catch(Exception e){ e.printStackTrace(); }
    %>

    <div class="card welcome">
      <h2>Welcome, <%= userName %> 👋</h2>
      <p>Balance: <strong>₹ <%= String.format("%.2f", balance) %></strong></p>
    </div>

    <div class="actions">
      <a class="btn" href="deposit.jsp">Deposit</a>
      <a class="btn" href="withdraw.jsp">Withdraw</a>
      <a class="btn" href="transfer.jsp">Transfer</a>
      <a class="btn" href="history">History</a>
    </div>
  </main>
</div>

<% String msg=(String)session.getAttribute("msg"); String msgType=(String)session.getAttribute("msgType"); 
   if(msg!=null){ %>
<script>showToast("<%=msg.replace("\"","\\\"")%>","<%=msgType%>");</script>
<% session.removeAttribute("msg"); session.removeAttribute("msgType"); } %>

<script>
function showToast(text,type){
  const t=document.getElementById('toast'); t.innerText=text; t.className='toast show '+(type||'info'); t.style.display='block';
  setTimeout(()=>{ t.className='toast'; t.style.display='none'; },3500);
}
function confirmLogout(e){
  e.preventDefault();
  if(confirm("Are you sure you want to logout?")){
    window.location.href = "logout";
  }
}
</script>
<div id="loader">
  <div class="loader-circle"></div>
</div>
<script>
function toggleDark(){
  document.body.classList.toggle("dark");
  localStorage.setItem("darkMode", document.body.classList.contains("dark"));
}
(function(){
  if(localStorage.getItem("darkMode") === "true"){
    document.body.classList.add("dark");
  }
})();
</script>

<script>
function showLoader(){
  document.getElementById("loader").style.display = "flex";
}
document.querySelectorAll("form").forEach(f=>{
  f.addEventListener("submit", showLoader);
});
</script>

</body>
</html>
