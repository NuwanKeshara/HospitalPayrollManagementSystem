<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.hms.prm.model.TestNurse"%>
<%@page import="com.hms.prm.service.NurseRelative"%>

<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>New Monthly Paysheets</title>
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
<br>


<center><h1>Paysheets To Be Created</h1></center>
<div class="bs-example">
	<table class="table table-dark table-hover table-bordered">
	<thead class="thead-dark">
		<tr>
			<th>ID</th>
			<th>Nurse Name</th>
			<th>Designation</th>
			<th>Basic Salary</th>
			
		</tr>
	</thead>
	<tbody>
		<%for(TestNurse nur : NurseRelative.findAllNurse()){ %>
			<tr>
				<td><%= nur.getId() %></td>
				<td><%= nur.getName() %></td>
				<td><%= nur.getDesignation() %></td>
				<td><%= String.format("%.2f",nur.getBasicSalary()) %></td>
				
			
				<td>
				<%if(!NurseRelative.checkNurse(nur.getId())){ %>
					<form action="CreatePaySheet" method="post">
						<input type="hidden" name="id" value="<%= nur.getId() %>">
						<input type="hidden" name="name" value="<%= nur.getName() %>">
						<input type="hidden" name="designation" value="<%= nur.getDesignation() %>">
						<input type="hidden" name="basicSalary" value="<%= String.format("%.2f",nur.getBasicSalary()) %>">
						<input type="hidden" name="stat" value="nurses">
						<input type="submit" value="Create" class="btn btn-danger btn-change7">
					</form>
				<%}else{ %>
					<form action="ViewPaySheet" method="post">
						<input type="hidden" name="id" value="<%= nur.getId() %>">
						<input type="hidden" name="name" value="<%= nur.getName() %>">
						<input type="hidden" name="designation" value="<%= nur.getDesignation() %>">
						<input type="hidden" name="basicSalary" value="<%= String.format("%.2f",nur.getBasicSalary()) %>">
						<input type="hidden" name="stat" value="nurses">
						<input type="submit" value="View" class="btn btn-success btn-change7">
					</form>
				<%} %>
				</td>
			</tr>
		<%} %>
	</tbody>
	</table>
</div>

</body>
</html>