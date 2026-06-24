<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
    <header class="topbar">
        <h1>Withdraw Money</h1>
        <nav>
            <a href="dashboard.jsp">Dashboard</a>
            <a href="logout">Logout</a>
        </nav>
    </header>

    <main class="card">
        <h2 class="center">🏧 Withdraw from Your Account</h2>

        <form action="withdraw" method="post" onsubmit="return validateWithdraw()">
            <label>Enter Amount (₹):</label>
            <input type="number" name="amount" id="wamount" placeholder="e.g. 500" required>

            <button class="btn" type="submit">Withdraw Now</button>
        </form>

        <p class="center muted">Secure withdrawal in seconds</p>
    </main>
</div>

<script>
function validateWithdraw(){
    const amt = document.getElementById("wamount").value;
    if(amt <= 0){
        alert("Please enter a valid withdrawal amount!");
        return false;
    }
    return confirm("Are you sure you want to withdraw ₹" + amt + "?");
}
</script>
<div id="loader">
  <div class="loader-circle"></div>
</div>

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
