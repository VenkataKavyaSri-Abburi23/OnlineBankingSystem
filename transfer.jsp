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
<title>Transfer</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
    <header class="topbar">
        <h1>Fund Transfer</h1>
        <nav>
            <a href="dashboard.jsp">Dashboard</a>
            <a href="logout">Logout</a>
        </nav>
    </header>

    <main class="card">
        <h2 class="center">🔁 Send Money Instantly</h2>

        <form action="transfer" method="post" onsubmit="return validateTransfer()">

            <label>Receiver Account ID:</label>
            <input type="number" name="receiver" id="receiver" placeholder="Enter receiver ID" required>

            <label>Transfer Amount (₹):</label>
            <input type="number" name="amount" id="tamount" placeholder="e.g. 200" required>

            <button class="btn" type="submit">Transfer Now</button>
        </form>

        <p class="center muted">Instant • Trusted • Fast Transfer</p>
    </main>
</div>

<script>
function validateTransfer(){
    const r = document.getElementById("receiver").value;
    const a = document.getElementById("tamount").value;

    if(r <= 0 || a <= 0){
        alert("Please enter valid details!");
        return false;
    }
    return confirm("Confirm transfer of ₹" + a + " to User ID " + r + " ?");
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
