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

  <link rel="stylesheet" href="assets/css/customStyles.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

  <script src="https://code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

</head>
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