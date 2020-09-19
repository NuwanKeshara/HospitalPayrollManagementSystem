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

	<link rel="stylesheet" href="assets/css/customStyles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

    <script src="https://code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
</head>
<body>

<!-- header start -->
  
  <!-- Navigation Menu -->
	<div style="margin-bottom: 3px; background:#1976D2" class="ui inverted segment">
		<div style="border:none" class="ui inverted secondary pointing menu">
			<i class="hospital big black icon"></i>
			<div class="right menu">
					<a style="font-size:16px" class= "item" href="index.html">Services</a>
					<a style="font-size:16px" class= "item" href="index.html">About Us</a>
					<a style="font-size:16px" class= "item" href="index.html">Contact Us</a>
					<button class="ui image grey button">Sign Up</button>
					<button class="ui image grey button">Login</button>
			</div>
		</div>
	</div>
	<!-- Navigation Menu-->
	
  <div class="page-wrapper">
	
		<!--  Induvidual Function Header -->
		
		<div class="ui segment blue inverted headerFunction">
			<h2 class="headerTextFunction">Hospital Management System</h2>
		</div>
		<!--  Individual Function Header end-->
		
		 <!-- Include Function Content staring from here -->
		 
  <!-- header end -->
  
  <!-- payroll function start -->

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

<!-- Footer Start -->
	<!-- Include Function Content staring from here -->
	
	</div>
	
	<!-- Footer Start -->
	<div class="ui grid ">
		<div class="row footer">

			<div class="four wide column"></div>
			<div class="four wide column">
				<h5 class="footerMenuColor">Address</h5>
				<p class="footerMenuItemColor">
					SLIIT Malabe Campus, <br>New Kandy Road, <br>Malabe 10115
				</p>
			</div>
			<div class="four wide column">
				<h5 class="footerMenuColor">Contacts</h5>
				<p class="footerMenuItemColor">
					Email: support@hms.com <br>Phone: 011 2476498
				</p>
			</div>
			<div class="four wide column">
				<h5 class="footerMenuColor">Quick Links</h5>
				<p class="footerMenuItemColor">
					<a style= "color:#BDBDBD" href="">Home</a> <br>
					<a style= "color:#BDBDBD" href="">About Us</a> <br>
					<a style= "color:#BDBDBD" href="">Contact Us</a>
				</p>
			</div>
		</div>
	</div>
	<!-- Footer End -->
<!-- Footer End -->

</body>
</html>