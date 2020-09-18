<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.hms.prm.model.Employee"%>
<%@page import="com.hms.prm.service.EmployeeRelative"%>

<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Past Monthly Paysheets</title>
<!-- <style>
table, th, td {
  border: 1px solid black;
}
</style>-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
    .bs-example{
    	margin: 40px;
    }
  
</style>

</head>

<body>

<p><a href="payroll_home.jsp" style="text-decoration:none;"><h1>PAYROLL HOME</h1></a></p>
<p><a href="view_older_payslip.jsp" style="text-decoration:none;"><h2>Older Payrolls</h2></a></p>

<br><br>
<form action="SearchFunction" method="post">
<input type="search" name="search">
<label ><input type = "submit" value="Search" ></label>
<input type = "hidden" value="employee" name="status">
</form>
<br><br>

<% String var = request.getParameter("id");%>


<center><h1>Payments</h1></center>
	<div class="bs-example">
	<table class="table table-dark table-hover table-bordered">
	<thead class="thead-dark">
		<tr>
			<th>ID</th>
			<th>Date</th>
			<th>Doctor Name</th>
			<th>Designation</th>
			<th>Basic Salary</th>
			<th>Overtime</th>
			<th>Medical</th>
			<th>Bonus</th>
			<th>Other</th>
			<th>Deduction Description</th>
			<th>Deduction Total</th>
			<th>Total Earnings</th>
			<th>Net Pay</th>
			<th>View</th>
			<th>Delete</th>
		</tr>
	</thead>
	<tbody>
		
		<% for(Employee employee : EmployeeRelative.findAllEmployees(var)){ %>
			<tr>
				<td><%= employee.getId() %></td>
				<td><%= employee.getDate() %></td>
				<td><%= employee.getName() %></td>
				<td><%= employee.getDesignation() %></td>
				<td><%= String.format("%.2f",employee.getBasicSalary()) %></td>
				<td><%= String.format("%.2f",employee.getOvertime()) %></td>
				<td><%= String.format("%.2f",employee.getMedical()) %></td>
				<td><%= String.format("%.2f",employee.getBonus()) %></td>
				<td><%= String.format("%.2f",employee.getOther()) %></td>
				<td><%= employee.getDeductionDescription() %></td>
				<td><%= String.format("%.2f",employee.getDeductionTotal()) %></td>
				<td><%= String.format("%.2f",employee.getTotalEarnings()) %></td>
				<td><%= String.format("%.2f",employee.getNetpay()) %></td>
				
				<td>
					<form action="EmployeeView" method="post">
						<input type="hidden" name="status" value="<%= var %>">
						<input type="hidden" name="id" value="<%= employee.getId() %>">
						<input type="hidden" name="date" value="<%= employee.getDate() %>">
						<input type="submit" value="View" class="btn btn-primary btn-change7">
					</form>
				<td>
					<form action="EmployeeDelete" method="post">
						<input type="hidden" name="status" value="<%= var %>">
						<input type="hidden" name="id" value="<%= employee.getId() %>">
						<input type="hidden" name="date" value="<%= employee.getDate() %>">
						<input type="submit" value="Delete" class="btn btn-danger btn-change7">
					</form>
				</td>
			</tr>
		<%} %>
	</tbody>
	</table>
</div>

</body>
</html>