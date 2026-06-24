<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.bank.model.Transaction" %>
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
<title>Transaction History</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container">
    <header class="topbar">
        <h1>Online Banking</h1>
        <nav>
            <a href="dashboard.jsp">Dashboard</a>
            <a href="deposit.jsp">Deposit</a>
            <a href="withdraw.jsp">Withdraw</a>
            <a href="transfer.jsp">Transfer</a>
            <a href="logout.jsp">Logout</a>
        </nav>
    </header>

    <main>
        <h2>Transaction History</h2>

        <%
            List<Transaction> list = (List<Transaction>) request.getAttribute("transactions");
            if (list == null || list.isEmpty()) {
        %>
            <p>No transactions found.</p>
        <%
            } else {
        %>

        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Type</th>
                    <th>Sender</th>
                    <th>Receiver</th>
                    <th>Amount</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (Transaction t : list) {
            %>
                <tr>
                    <td><%= t.getId() %></td>
                    <td><%= t.getType() %></td>
                    <td><%= t.getSender() == 0 ? "System" : t.getSender() %></td>
                    <td><%= t.getReceiver() == 0 ? "System" : t.getReceiver() %></td>
                    <td>₹ <%= String.format("%.2f", t.getAmount()) %></td>
                    <td><%= t.getDate() %></td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <%
            }
        %>

    </main>
</div>
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
