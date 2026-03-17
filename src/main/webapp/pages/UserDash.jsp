<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DashBoard | Expense Tracker</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<style>
body {
    background: white;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 50vh;
    padding-top: 130px;
}
.DashCard {
    width: 650px;
    padding: 30px;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

/* ✅ Toast popup styles */
.toast-container {
    position: fixed;
    top: 24px;
    right: 24px;
    z-index: 9999;
}
.toast {
    min-width: 300px;
}
</style>

<body>

<%-- ✅ Login success toast popup --%>
<% if ("login".equals(request.getParameter("success"))) { %>
<div class="toast-container">
    <div id="loginToast" class="toast align-items-center text-white bg-success border-0 show" role="alert">
        <div class="d-flex">
            <div class="toast-body d-flex align-items-center gap-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </svg>
                <strong>Login Successful!</strong>&nbsp; Welcome back 👋
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    </div>
</div>
<% } %>

<%-- ✅ Expense added success toast --%>
<% if ("expense".equals(request.getParameter("success"))) { %>
<div class="toast-container">
    <div id="expenseToast" class="toast align-items-center text-white bg-primary border-0 show" role="alert">
        <div class="d-flex">
            <div class="toast-body d-flex align-items-center gap-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </svg>
                <strong>Expense Added Successfully!</strong>
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    </div>
</div>
<% } %>

<div class="DashCard">
    <h1 style="text-align: center">Welcome To Expense Tracker</h1>

    <h3 style="text-align: center ; text:bold "><a href="AddExpense" class="btn btn-primary w-40">Add Expense</a></h3>
    <h3 style="text-align: center ; text:bold"><a href="ExpenseList" class="btn btn-primary w-40">Expense List</a></h3>

    <h5 style="text-align: center">Track And Manage your Expenses effectively. Use the navigation link to add new expenses or view your expense history</h5>
    <a href="logout" class="btn btn-danger mt-3">Logout</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
    // Auto-hide all toasts after 3.5 seconds
    window.addEventListener('load', function () {
        document.querySelectorAll('.toast.show').forEach(function(toastEl) {
            setTimeout(function () {
                var toast = new bootstrap.Toast(toastEl, { autohide: true, delay: 100 });
                toast.hide();
            }, 3500);
        });
    });
</script>

</body>
</html>
