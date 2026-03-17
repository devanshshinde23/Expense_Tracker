<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Expense </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<style>

 	body {
	 background: white;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .addExpnese-card {
      width: 650px;
      padding: 30px;
      background: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .form-title {
      text-align: center;
      margin-bottom: 20px;
      font-weight: bold;
      color: #343a40;
    }
	</style>
<body>
</head>


<div class="addExpnese-card">
	<div class="mb-5">
	 	<h2 class="form-title"> Add Your Expense </h2>
	 	<form action="/saveExpense" method="post">
	 	<div class="mb-3">
	 	
	 	
	 	<label for="name" class="lable">Expense Name</label>
	 	<input type="text" name="expensename" class="form-control" placeholder="Enter Expense Name  " required>
		</div>
		
		<div class="mb-3">
	 	
	 	<label for="amount" class="form-label">Amount  </label>
	 	<input type="text" name="amount" class="form-control" placeholder="Enter Amount  " required>
		</div>
		
		<div class="mb-3">
	 	
	 	<label for="date" class="form-label">Date  </label>
	 	<input type="date" name="date" class="form-control" placeholder="Enter Date  " required>
		</div>
		
		<div class="mb-3">
	 	
	 	<label for="description" class="form-label">Description   </label>
	 	<input type="text" name="description" class="form-control" placeholder="Enter Your Username " required>
		</div>
		<button type="submit" class="btn btn-primary w-100" style="justify-content : center ; background-color : green ; width: 100">Add Expense </button>
		
		</form>
		
		
		
	</div>
</div>

</body>
</html>