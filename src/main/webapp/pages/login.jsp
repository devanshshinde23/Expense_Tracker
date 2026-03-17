<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | Expense Tracker</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<style>
  @import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap');

  * { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    font-family: 'DM Sans', sans-serif;
    background: linear-gradient(135deg, #e0f0ff 0%, #f8f9fa 60%, #eaf4e8 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
  }

  .login-card {
    width: 400px;
    padding: 40px 36px 32px;
    background: #fff;
    border-radius: 16px;
    box-shadow: 0 8px 32px rgba(0,0,0,0.10);
  }

  .login-title {
    text-align: center;
    margin-bottom: 28px;
    font-weight: 700;
    font-size: 1.6rem;
    color: #1a1a2e;
    letter-spacing: -0.5px;
  }

  /* ── Labels & Inputs (matches registration page) ── */
  .form-label {
    font-weight: 500;
    color: #444;
    margin-bottom: 4px;
  }

  .form-control {
    border-radius: 8px;
    border: 1.5px solid #d1d5db;
    padding: 10px 14px;
    font-size: 0.97rem;
    font-family: 'DM Sans', sans-serif;
    transition: border-color 0.2s;
  }

  .form-control:focus {
    border-color: #3b82f6;
    box-shadow: 0 0 0 3px rgba(59,130,246,0.13);
    outline: none;
  }

  /* ── Login Button (matches registration page) ── */
  .btn-login {
    width: 100%;
    padding: 14px;
    font-size: 1.1rem;
    font-weight: 600;
    border-radius: 10px;
    background: linear-gradient(90deg, #2563eb, #3b82f6);
    border: none;
    color: #fff;
    letter-spacing: 0.3px;
    cursor: pointer;
    transition: background 0.2s, transform 0.1s, box-shadow 0.2s;
    box-shadow: 0 4px 14px rgba(59,130,246,0.25);
    margin-top: 8px;
  }

  .btn-login:hover {
    background: linear-gradient(90deg, #1d4ed8, #2563eb);
    transform: translateY(-1px);
    box-shadow: 0 6px 18px rgba(59,130,246,0.30);
  }

  .btn-login:active { transform: translateY(0); }

  .register-link {
    display: block;
    text-align: center;
    margin-top: 18px;
    color: #555;
    font-size: 0.92rem;
  }

  .register-link a {
    color: #2563eb;
    font-weight: 600;
    text-decoration: none;
  }

  .register-link a:hover { text-decoration: underline; }

  /* ── Popup Overlay ── */
  .popup-overlay {
    display: none;
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.35);
    backdrop-filter: blur(3px);
    z-index: 9999;
    justify-content: center;
    align-items: center;
  }

  .popup-overlay.show {
    display: flex;
    animation: fadeIn 0.25s ease;
  }

  @keyframes fadeIn {
    from { opacity: 0; }
    to   { opacity: 1; }
  }

  .popup-box {
    background: #fff;
    border-radius: 18px;
    padding: 44px 40px 36px;
    width: 340px;
    text-align: center;
    box-shadow: 0 16px 48px rgba(0,0,0,0.16);
    animation: popIn 0.35s cubic-bezier(0.34,1.56,0.64,1);
  }

  @keyframes popIn {
    from { transform: scale(0.7); opacity: 0; }
    to   { transform: scale(1);   opacity: 1; }
  }

  .popup-icon-circle {
    width: 68px;
    height: 68px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 20px;
  }

  .popup-icon-circle.error   { background: linear-gradient(135deg, #ef4444, #dc2626); box-shadow: 0 6px 20px rgba(239,68,68,0.30); }
  .popup-icon-circle.success { background: linear-gradient(135deg, #22c55e, #16a34a); box-shadow: 0 6px 20px rgba(34,197,94,0.30); }

  .popup-icon-circle svg {
    width: 36px;
    height: 36px;
    stroke: #fff;
    stroke-width: 3;
    fill: none;
    stroke-linecap: round;
    stroke-linejoin: round;
  }

  .popup-title {
    font-size: 1.4rem;
    font-weight: 700;
    color: #1a1a2e;
    margin-bottom: 8px;
  }

  .popup-message {
    font-size: 0.95rem;
    color: #6b7280;
    margin-bottom: 28px;
    line-height: 1.5;
  }

  .popup-btn {
    display: inline-block;
    padding: 12px 36px;
    font-weight: 600;
    font-size: 1rem;
    border: none;
    border-radius: 9px;
    cursor: pointer;
    transition: background 0.2s, transform 0.1s;
    font-family: 'DM Sans', sans-serif;
  }

  .popup-btn:hover { transform: translateY(-1px); }
  .popup-btn.error   { background: linear-gradient(90deg, #ef4444, #dc2626); color: #fff; box-shadow: 0 4px 12px rgba(239,68,68,0.25); }
  .popup-btn.success { background: linear-gradient(90deg, #22c55e, #16a34a); color: #fff; box-shadow: 0 4px 12px rgba(34,197,94,0.25); }
</style>
</head>
<body>

<%-- ERROR POPUP --%>
<% if (request.getParameter("error") != null) { %>
<div class="popup-overlay show" id="errorPopup">
  <div class="popup-box">
    <div class="popup-icon-circle error">
      <svg viewBox="0 0 24 24"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
    </div>
    <div class="popup-title">Login Failed!</div>
    <div class="popup-message">Invalid username or password.<br>Please check your credentials and try again.</div>
    <button class="popup-btn error" onclick="closePopup('errorPopup')">Try Again</button>
  </div>
</div>
<% } %>

<%-- LOGOUT SUCCESS POPUP --%>
<% if (request.getParameter("logout") != null) { %>
<div class="popup-overlay show" id="logoutPopup">
  <div class="popup-box">
    <div class="popup-icon-circle success">
      <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
    </div>
    <div class="popup-title">Logged Out!</div>
    <div class="popup-message">You have been logged out successfully.<br>See you next time!</div>
    <button class="popup-btn success" onclick="closePopup('logoutPopup')">OK</button>
  </div>
</div>
<% } %>

<!-- ── Login Card ── -->
<div class="login-card">
  <h2 class="login-title">Login Page</h2>

  <form action="/login" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

    <div class="mb-3">
      <label for="username" class="form-label">Username</label>
      <input type="text" id="username" name="username" class="form-control"
             placeholder="Enter Your Username" required>
    </div>

    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" id="password" name="password" class="form-control"
             placeholder="Enter Your Password" required>
    </div>

    <button type="submit" class="btn-login">Login</button>
  </form>

  <p class="register-link">New User? <a href="/RegistrationPage">Register Here</a></p>
</div>

<script>
  function closePopup(id) {
    document.getElementById(id).classList.remove('show');
  }

  // Auto close popups after 4 seconds
  window.addEventListener('load', function () {
    setTimeout(function () {
      document.querySelectorAll('.popup-overlay.show').forEach(function (el) {
        el.classList.remove('show');
      });
    }, 4000);
  });
</script>

</body>
</html>