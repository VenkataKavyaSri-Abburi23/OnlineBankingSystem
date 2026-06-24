<%@ page import="java.sql.*, com.bank.dao.DBConnection"%>
<%
if (session.getAttribute("userId") == null) {
    response.sendRedirect("login.jsp");
    return;
}
int userId = (int) session.getAttribute("userId");
String name="", email="";
double balance=0;

try(Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT name,email,balance FROM users WHERE id=?")){
ps.setInt(1,userId);
ResultSet rs = ps.executeQuery();
if(rs.next()){
name = rs.getString("name");
email = rs.getString("email");
balance = rs.getDouble("balance");
}
}catch(Exception e){ e.printStackTrace(); }
%>

<!DOCTYPE html>
<html>
<head>
<title>User Profile</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
<header class="topbar">
  <h1>User Profile</h1>
  <nav>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="#" onclick="confirmLogout(event)">Logout</a>
  </nav>
</header>

<main class="card">
  <h2>Profile Information</h2>
  <p><b>Name:</b> <%=name%></p>
  <p><b>Email:</b> <%=email%></p>
  <p><b>Balance:</b>  <%=balance%></p>
</main>
</div>

</body>
</html>
