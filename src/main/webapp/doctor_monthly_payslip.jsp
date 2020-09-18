<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.hms.prm.model.Doctor"%>
<%@page import="com.hms.prm.service.DoctorRelative"%>

<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Doctor Monthly Paysheets</title>

<!--  <style>
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
<p><a href="view_monthly_payslip.jsp" style="text-decoration:none;"><h2>Existing Payrolls</h2></a></p>

<br>

<form action="SearchFunction" method="post">
<input type="search" name="search">
<label ><input type = "submit" value="Search" ></label>
<input type = "hidden" value="doctor" name="status">
</form>

<br><br>

<center><h1>Doctor Payments</h1></center>
<div class="bs-example">
	<table class="table table-dark table-hover table-bordered">
	<thead class="thead-dark">
		<tr>
			<th>ID</th>
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
			<th>Update</th>
			<th>Delete</th>
		</tr>
	</thead>
	<tbody>
		
		<% for(Doctor doctor : DoctorRelative.findAllDoctors()){ %>
			<tr>
				<td><%= doctor.getId() %></td>
				<td><%= doctor.getName() %></td>
				<td><%= doctor.getDesignation() %></td>
				<td><%= String.format("%.2f",doctor.getBasicSalary()) %></td>
				<td><%= String.format("%.2f",doctor.getOvertime()) %></td>
				<td><%= String.format("%.2f",doctor.getMedical()) %></td>
				<td><%= String.format("%.2f",doctor.getBonus()) %></td>
				<td><%= String.format("%.2f",doctor.getOther()) %></td>
				<td><%= doctor.getDeductionDescription() %></td>
				<td><%= String.format("%.2f",doctor.getDeductionTotal()) %></td>
				<td><%= String.format("%.2f",doctor.getTotalEarnings()) %></td>
				<td><%= String.format("%.2f",doctor.getNetPay()) %></td>
				
				<td>
					<form action="DoctorUpdate" method="post">
						<input type="hidden" name="id" value="<%= doctor.getId() %>">
						<input type="submit" value="Update" class="btn btn-primary btn-change7">
					</form>
				<td>
					<form action="DoctorDelete" method="post">
						<input type="hidden" name="id" value="<%= doctor.getId() %>">
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