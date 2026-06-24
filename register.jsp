<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Register</title>
<link rel="stylesheet" href="css/style.css"></head>
<body>
<div class="container">
  <header class="topbar small"><h1>Online Banking System</h1></header>

  <main class="card">
    <h2 class="center">Register</h2>
    <div id="toast" class="toast" style="display:none;"></div>

    <form action="register" method="post" onsubmit="return validateRegister()">
      <label>Name</label><br><input type="text" name="name" required><br><br>
      <label>Email</label><br><input type="email" name="email" required><br><br>
      <label>Password</label><br><input type="password" name="password" required minlength="4"><br><br>
      <button class="btn" type="submit">Register</button>
    </form>

    <p class="center muted">Already have an account? <a href="login.jsp">Login</a></p>
  </main>
</div>

<% String msg=(String)session.getAttribute("msg"); String msgType=(String)session.getAttribute("msgType");
   if(msg!=null){ %>
<script>showToast("<%=msg.replace("\"","\\\"")%>","<%=msgType%>");</script>
<% session.removeAttribute("msg"); session.removeAttribute("msgType"); } %>

<script>
function validateRegister(){
  return true;
}
function showToast(text,type){
  const t=document.getElementById('toast'); t.innerText=text; t.className='toast show '+(type||'info'); t.style.display='block';
  setTimeout(()=>{ t.className='toast'; t.style.display='none'; },3500);
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
