<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container">
  <header class="topbar small">
    <h1>Online Banking System</h1>
  </header>

  <main class="card">
    <h2 class="center">Login</h2>

    <!-- Toast area -->
    <div id="toast" class="toast" style="display:none;"></div>

    <form id="loginForm" action="login" method="post" onsubmit="return validateLogin()">
      <label>Email:</label><br>
      <input type="email" name="email" required><br><br>

      <label>Password:</label><br>
      <input type="password" name="password" required minlength="4"><br><br>

      <button class="btn" type="submit">Login</button>
    </form>

    <p class="center muted">New User? <a href="register.jsp">Register Here</a></p>
  </main>
</div>

<script>
  // show message from session attribute (server puts msg & msgType in request/session)
  (function(){
    const urlParams = new URLSearchParams(window.location.search);
  })();

  // simple client validation
  function validateLogin(){
    const f = document.getElementById('loginForm');
    if(!f.email.value || !f.password.value) return false;
    return true;
  }

  // show toast if server sent one (JSP will write inline script with values)
</script>

<%-- server-to-client toast: read and clear session attributes --%>
<%
    String msg = (String) session.getAttribute("msg");
    String msgType = (String) session.getAttribute("msgType");
    if(msg != null) {
%>
<script>
  showToast("<%= msg.replace("\"","\\\"") %>", "<%= msgType %>");
</script>
<%
      session.removeAttribute("msg");
      session.removeAttribute("msgType");
    }
%>

<script>
function showToast(text, type){
  const t = document.getElementById('toast');
  t.innerText = text;
  t.className = 'toast show ' + (type || 'info');
  t.style.display = 'block';
  setTimeout(()=>{ t.className = 'toast'; t.style.display='none'; }, 3500);
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
