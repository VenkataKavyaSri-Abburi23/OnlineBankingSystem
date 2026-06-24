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
<title>Deposit</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
    <header class="topbar">
        <h1>Deposit Money</h1>
        <nav>
            <a href="dashboard.jsp">Dashboard</a>
            <a href="logout">Logout</a>
        </nav>
    </header>

    <main class="card">
        <h2 class="center">💰 Add Money to Your Account</h2>

        <form action="deposit" method="post" onsubmit="return validateDeposit()">
            <label>Enter Amount (₹):</label>
            <input type="number" name="amount" id="amount" placeholder="e.g. 1000" required>

            <button class="btn" type="submit">Deposit Now</button>
        </form>

        <p class="center muted">Fast • Safe • Secure</p>
    </main>
</div>

<script>
function validateDeposit(){
    const amt = document.getElementById("amount").value;
    if(amt <= 0){
        alert("Please enter a valid deposit amount!");
        return false;
    }
    return true;
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
