<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Expense List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .toast-container {
            position: fixed;
            top: 24px;
            right: 24px;
            z-index: 9999;
        }
        .toast { min-width: 300px; }

        /* ✅ Username badge styling */
        .user-badge {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            background: #f0f4ff;
            border: 1px solid #d0d9f5;
            border-radius: 20px;
            padding: 4px 12px;
            font-size: 0.85rem;
            font-weight: 600;
            color: #3a57c7;
        }
        .user-avatar {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background: #3a57c7;
            color: white;
            font-size: 0.7rem;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-transform: uppercase;
        }
    </style>
</head>
<body>

<%-- Delete success toast --%>
<% if ("deleted".equals(request.getParameter("success"))) { %>
<div class="toast-container">
    <div id="deleteToast" class="toast align-items-center text-white bg-danger border-0 show" role="alert">
        <div class="d-flex">
            <div class="toast-body d-flex align-items-center gap-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                </svg>
                <strong>Expense Deleted</strong>&nbsp; successfully.
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    </div>
</div>
<% } %>

<%-- Update success toast --%>
<% if ("updated".equals(request.getParameter("success"))) { %>
<div class="toast-container">
    <div id="updateToast" class="toast align-items-center text-white bg-success border-0 show" role="alert">
        <div class="d-flex">
            <div class="toast-body d-flex align-items-center gap-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </svg>
                <strong>Expense Updated</strong>&nbsp; successfully.
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    </div>
</div>
<% } %>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h1 style="font-weight: bold;">Expense List</h1>
        <a href="/UserDash" class="btn btn-secondary">← Back to Dashboard</a>
    </div>

    <table class="table table-bordered table-striped align-middle">
        <thead class="table-dark">
            <tr>
                <th>Expense Id</th>             
                <th>Expense Name</th>
                <th>Amount</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="expense" items="${temp}">
                <tr>
                    <td>${expense.id } </td>
                    <td>${expense.expensename}</td>
                    <td>₹ ${expense.amount}</td>
                    <td>${expense.description}</td>
                    <td>
                        <a href="edit/${expense.id}" class="btn btn-primary btn-sm">Update</a>
                        <a href="delete/${expense.id}" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
    window.addEventListener('load', function () {
        document.querySelectorAll('.toast.show').forEach(function (toastEl) {
            setTimeout(function () {
                var toast = new bootstrap.Toast(toastEl, { autohide: true, delay: 100 });
                toast.hide();
            }, 3500);
        });
    });
</script>

</body>
</html>