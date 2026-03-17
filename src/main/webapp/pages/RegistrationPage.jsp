
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
  crossorigin="anonymous">
 
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
    transition: border-color 0.2s;
  }
 
  .form-control:focus {
    border-color: #3b82f6;
    box-shadow: 0 0 0 3px rgba(59,130,246,0.13);
  }
 
  .btn-register {
    width: 100%;
    padding: 14px;
    font-size: 1.1rem;
    font-weight: 600;
    border-radius: 10px;
    background: linear-gradient(90deg, #2563eb, #3b82f6);
    border: none;
    color: #fff;
    letter-spacing: 0.3px;
    transition: background 0.2s, transform 0.1s, box-shadow 0.2s;
    box-shadow: 0 4px 14px rgba(59,130,246,0.25);
    margin-top: 8px;
  }
 
  .btn-register:hover {
    background: linear-gradient(90deg, #1d4ed8, #2563eb);
    transform: translateY(-1px);
    box-shadow: 0 6px 18px rgba(59,130,246,0.30);
  }
 
  .btn-register:active {
    transform: translateY(0);
  }
 
  .login-link {
    display: block;
    text-align: center;
    margin-top: 18px;
    color: #555;
    font-size: 0.92rem;
    text-decoration: none;
  }
 
  .login-link a {
    color: #2563eb;
    font-weight: 600;
    text-decoration: none;
  }
 
  .login-link a:hover { text-decoration: underline; }
 
  /* ── Success Popup Overlay ── */
  .popup-overlay {
    display: none;
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.35);
    backdrop-filter: blur(3px);
    z-index: 1000;
    justify-content: center;
    align-items: center;
  }
 
  .popup-overlay.show { display: flex; }
 
  .popup-box {
    background: #fff;
    border-radius: 18px;
    padding: 44px 40px 36px;
    text-align: center;
    width: 340px;
    box-shadow: 0 16px 48px rgba(0,0,0,0.16);
    animation: popIn 0.35s cubic-bezier(0.34,1.56,0.64,1);
  }
 
  @keyframes popIn {
    from { transform: scale(0.7); opacity: 0; }
    to   { transform: scale(1);   opacity: 1; }
  }
 
  .popup-icon {
    width: 68px;
    height: 68px;
    background: linear-gradient(135deg, #22c55e, #16a34a);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 20px;
    box-shadow: 0 6px 20px rgba(34,197,94,0.30);
  }
 
  .popup-icon svg {
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
 
  .popup-msg {
    color: #6b7280;
    font-size: 0.97rem;
    margin-bottom: 28px;
    line-height: 1.5;
  }
 
  .popup-btn {
    display: inline-block;
    padding: 12px 36px;
    background: linear-gradient(90deg, #2563eb, #3b82f6);
    color: #fff;
    font-weight: 600;
    font-size: 1rem;
    border: none;
    border-radius: 9px;
    cursor: pointer;
    text-decoration: none;
    transition: background 0.2s, transform 0.1s;
    box-shadow: 0 4px 12px rgba(59,130,246,0.25);
  }
 
  .popup-btn:hover {
    background: linear-gradient(90deg, #1d4ed8, #2563eb);
    transform: translateY(-1px);
  }
</style>
</head>
<body>
 
<!-- ── Success Popup ── -->
<div class="popup-overlay" id="successPopup">
  <div class="popup-box">
    <div class="popup-icon">
      <svg viewBox="0 0 24 24">
        <polyline points="20 6 9 17 4 12"/>
      </svg>
    </div>
    <div class="popup-title">Registration Successful!</div>
    <div class="popup-msg">Your account has been created.<br>You can now log in.</div>
    <a href="LoginPage" class="popup-btn">Go to Login</a>
  </div>
</div>
 
<!-- ── Registration Card ── -->
<div class="login-card">
  <h2 class="login-title">Create an Account</h2>
 
  <form id="registerForm" action="/saveuser" method="post">
 
    <div class="mb-3">
      <label class="form-label">User Name</label>
      <input type="text" name="username" class="form-control"
             placeholder="Enter your username" required>
    </div>
 
    <div class="mb-3">
      <label class="form-label">Password</label>
      <input type="password" name="password" class="form-control"
             placeholder="Enter your password" required>
    </div>
 
    <div class="mb-3">
      <label class="form-label">Full Name</label>
      <input type="text" name="name" class="form-control"
             placeholder="Enter your full name" required>
    </div>
 
    <div class="mb-3">
      <label class="form-label">Email</label>
      <input type="email" name="email" class="form-control"
             placeholder="Enter your email" required>
    </div>
 
    <button type="submit" class="btn-register">Register</button>
 
  </form>
 
  <p class="login-link">Already have an account? <a href="login">Login Here</a></p>
</div>
 
<script>
  document.getElementById('registerForm').addEventListener('submit', function(e) {
    e.preventDefault(); // Stop normal submit

    const form = this;

    // Show popup first
    document.getElementById('successPopup').classList.add('show');

    // Then actually submit the form to /saveuser after a short delay
    setTimeout(function() {
      form.submit(); // ← THIS actually sends data to Spring
    }, 1500); // 1.5 second delay so user sees the popup
  });
</script>
 
</body>
</html>