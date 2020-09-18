<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<%@page import="com.hms.prm.model.Doctor"%>


<html>
<head>
<!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<title>Payroll Management</title>
	
	<!-- Icons font CSS-->
    <link href="assets/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="assets/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="assets/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="assets/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="assets/css/main.css" rel="stylesheet" media="all">
</head>

<body>

<p><a href="payroll_home.jsp" style="text-decoration:none;"><h1>PAYROLL HOME</h1></a></p>
<p><a href="view_monthly_payslip.jsp" style="text-decoration:none;"><h2>Existing Payrolls</h2></a></p>
<br>


	
    <% Doctor doctor = (Doctor) request.getAttribute("doctor"); %>
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">Doctor Paysheet</h2>
                </div>
                <div class="card-body">
                    <form action="DoctorMonthlyPaySlipSave" method="POST">
                        <div class="form-row m-b-55">
                            <div class="name">Date</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group-desc">
											<h4><b><%= doctor.getDate() %></b></h4>
                                            <input class="input--style-5" type="hidden" name="date" value="<%= doctor.getDate() %>">
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
						<div class="form-row m-b-55">
                            <div class="name">ID</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group-desc">
										<h4><b><%= doctor.getId() %></b></h4>
                                            <input class="input--style-5" type="hidden" name="id" value="<%= doctor.getId() %>">
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Name</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="name" value="<%= doctor.getName() %>" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Designation</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="designation" value="<%= doctor.getDesignation() %>"
                	required >
                                </div>
                            </div>
                        </div>
						<div class="form-row">
                            <div class="name">Basic Salary</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="number" name="basicSalary" value="<%= String.format("%.2f",doctor.getBasicSalary()) %>"
                			min="0" step=".01"
                	required >
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Overtime</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="number" name="overtime" value="<%= String.format("%.2f",doctor.getOvertime()) %>"
                			min="0" step=".01"
                	required >
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Medical</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="number" name="medical" value="<%= String.format("%.2f",doctor.getMedical()) %>"
                			min="0" step=".01"
                	required>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Bonus</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="number" name="bonus" value="<%= String.format("%.2f",doctor.getBonus()) %>"
                			min="0" step=".01"
                	required>
                                </div>
                            </div>
                        </div>
						<div class="form-row">
                            <div class="name">Other</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="number" name="other" value="<%= String.format("%.2f",doctor.getOther()) %>"
                			min="0" step=".01"
                	required>
                                </div>
                            </div>
                        </div>
						<div class="form-row">
                            <div class="name">Deduction Description</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="deductionDescription" value="<%= doctor.getDeductionDescription() %>"
                	required>
                                </div>
                            </div>
                        </div>
						<div class="form-row">
                            <div class="name">Deduction Total</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="number" name="deductionTotal" value="<%= String.format("%.2f",doctor.getDeductionTotal()) %>"
                			min="0" step=".01"
                	required>
                                </div>
                            </div>
                        </div>
						<div class="form-row">
                            <div class="name">Total Earnings</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="number" name="TotalEarnings" value="<%= String.format("%.2f",doctor.getTotalEarnings()) %>"
                			min="0" step=".01"
                	required>
                                </div>
                            </div>
                        </div>
						<div class="form-row">
                            <div class="name">Net Salary</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="netPay" value="<%= String.format("%.2f",doctor.getNetPay()) %>"
                			min="0" step=".01"
                	required>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button name ="action" class="btn btn--radius-2 btn--blue" type="submit" value="Save">Save</button>
							<button name ="action" class="btn btn--radius-2 btn--red" type="submit" value="Cancel">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="assets/vendor/select2/select2.min.js"></script>
    <script src="assets/vendor/datepicker/moment.min.js"></script>
    <script src="assets/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="assets/js/global.js"></script>	
</body>
</html>