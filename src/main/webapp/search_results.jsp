<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.hms.prm.model.Employee"%>
<%@page import="com.hms.prm.model.Doctor"%>
<%@page import="com.hms.prm.model.Nurse"%>
<%@page import="com.hms.prm.model.Staff"%>


<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Paysheets</title>
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
<p><a href="create_payslip.jsp" style="text-decoration:none;"><h2>Create Payroll</h2></a></p>
<p><a href="view_monthly_payslip.jsp" style="text-decoration:none;"><h2>Existing Payrolls</h2></a></p>
<p><a href="view_older_payslip.jsp" style="text-decoration:none;"><h2>Older Payrolls</h2></a></p>

<br><br>




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
			
		</tr>
	</thead>
	<tbody>
		
		<% String status = (String) request.getAttribute("status");

		if(status.equals("doctor")){
			List<Doctor> result = (List<Doctor>) request.getAttribute("employee");
			for(Doctor emp : result){ %>
		
		<tr>
		<td><%= emp.getId() %></td>
		<td><%= emp.getDate() %></td>
		<td><%= emp.getName() %></td>
		<td><%= emp.getDesignation() %></td>
		<td><%= String.format("%.2f",emp.getBasicSalary()) %></td>
		<td><%= String.format("%.2f",emp.getOvertime()) %></td>
		<td><%= String.format("%.2f",emp.getMedical()) %></td>
		<td><%= String.format("%.2f",emp.getBonus()) %></td>
		<td><%= String.format("%.2f",emp.getOther()) %></td>
		<td><%= emp.getDeductionDescription() %></td>
		<td><%= String.format("%.2f",emp.getDeductionTotal()) %></td>
		<td><%= String.format("%.2f",emp.getTotalEarnings()) %></td>
		<td><%= String.format("%.2f",emp.getNetPay()) %></td>
		
		
	</tr>
<%} %>
</tbody>
	</table>
</div>

<%} 	
		else if(status.equals("nurse")){
			List<Nurse> result = (List<Nurse>) request.getAttribute("employee");
			for(Nurse emp : result){ %>
		
		<tr>
		<td><%= emp.getId() %></td>
		<td><%= emp.getDate() %></td>
		<td><%= emp.getName() %></td>
		<td><%= emp.getDesignation() %></td>
		<td><%= String.format("%.2f",emp.getBasicSalary()) %></td>
		<td><%= String.format("%.2f",emp.getOvertime()) %></td>
		<td><%= String.format("%.2f",emp.getMedical()) %></td>
		<td><%= String.format("%.2f",emp.getBonus()) %></td>
		<td><%= String.format("%.2f",emp.getOther()) %></td>
		<td><%= emp.getDeductionDescription() %></td>
		<td><%= String.format("%.2f",emp.getDeductionTotal()) %></td>
		<td><%= String.format("%.2f",emp.getTotalEarnings()) %></td>
		<td><%= String.format("%.2f",emp.getNetpay()) %></td>
		
		
	</tr>
<%} %>
	</tbody>
	</table>
</div>

<%} 
		else if(status.equals("staff")){
			List<Staff> result = (List<Staff>) request.getAttribute("employee");
			for(Staff emp : result){ %>
		
		<tr>
		<td><%= emp.getId() %></td>
		<td><%= emp.getDate() %></td>
		<td><%= emp.getName() %></td>
		<td><%= emp.getDesignation() %></td>
		<td><%= String.format("%.2f",emp.getBasicSalary()) %></td>
		<td><%= String.format("%.2f",emp.getOvertime()) %></td>
		<td><%= String.format("%.2f",emp.getMedical()) %></td>
		<td><%= String.format("%.2f",emp.getBonus()) %></td>
		<td><%= String.format("%.2f",emp.getOther()) %></td>
		<td><%= emp.getDeductionDescription() %></td>
		<td><%= String.format("%.2f",emp.getDeductionTotal()) %></td>
		<td><%= String.format("%.2f",emp.getTotalEarnings()) %></td>
		<td><%= String.format("%.2f",emp.getNetpay()) %></td>
		
		
	</tr>
<%} %>
	</tbody>
	</table>
</div>

<%} 
		else{
			List<Employee> result = (List<Employee>) request.getAttribute("employee");
			for(Employee emp : result){ 
%>
		
		
			<tr>
				<td><%= emp.getId() %></td>
				<td><%= emp.getDate() %></td>
				<td><%= emp.getName() %></td>
				<td><%= emp.getDesignation() %></td>
				<td><%= String.format("%.2f",emp.getBasicSalary()) %></td>
				<td><%= String.format("%.2f",emp.getOvertime()) %></td>
				<td><%= String.format("%.2f",emp.getMedical()) %></td>
				<td><%= String.format("%.2f",emp.getBonus()) %></td>
				<td><%= String.format("%.2f",emp.getOther()) %></td>
				<td><%= emp.getDeductionDescription() %></td>
				<td><%= String.format("%.2f",emp.getDeductionTotal()) %></td>
				<td><%= String.format("%.2f",emp.getTotalEarnings()) %></td>
				<td><%= String.format("%.2f",emp.getNetpay()) %></td>
				
				
			</tr>
		<%} %>
	</tbody>
	</table>
</div>
<%} %>
</body>
</html>