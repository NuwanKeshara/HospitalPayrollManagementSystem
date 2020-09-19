<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>


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
<p><a href="create_payslip.jsp" style="text-decoration:none;"><h2>Create Payrolls</h2></a></p><br>


	
    <% String[] data = (String[])request.getAttribute("data"); %>
		   
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title"><%=data[4]%> Paysheet</h2>
                </div>
                <div class="card-body">
                    <form action="PayrollSave" method="POST">
				
                        <div class="form-row m-b-55">
                            <div class="name">Date</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group-desc">
											
                                            <input class="input--style-5" type="date" name="date" placeholder="yyyy-mm-dd" required>
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
										<h4><b><%=data[0] %></b></h4>
                                            <input class="input--style-5" type="hidden" name="id" value="<%=data[0] %>">
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Name</div>
                            <div class="value">
                                <div class="input-group">
								<h4><b><%=data[1] %></b></h4>
                                    <input class="input--style-5" type="hidden" name="name" value="<%=data[1] %>" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Designation</div>
                            <div class="value">
                                <div class="input-group">
									<h4><b><%=data[2] %></b></h4>
                                    <input class="input--style-5" type="hidden" name="designation" value="<%=data[2] %>"
                	required >
                                </div>
                            </div>
                        </div>
						<div class="form-row">
                            <div class="name">Basic Salary</div>
                            <div class="value">
                                <div class="input-group">
									<h4><b><%=data[3] %></b></h4>
                                    <input class="input--style-5" type="hidden" name="basicSalary" value="<%=data[3] %>"
                			min="0" step=".01"
                	required >
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Overtime</div>
                            <div class="value">
                                <div class="input-group">
									
                                    <input class="input--style-5" type="number" name="overtime" value=""
                			min="0" step=".01"
                	required >
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Medical</div>
                            <div class="value">
                                <div class="input-group">
									
                                    <input class="input--style-5" type="number" name="medical" value=""
                			min="0" step=".01"
                	required>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Bonus</div>
                            <div class="value">
                                <div class="input-group">
									
                                    <input class="input--style-5" type="number" name="bonus" value=""
                			min="0" step=".01"
                	required>
                                </div>
                            </div>
                        </div>
						<div class="form-row">
                            <div class="name">Other</div>
                            <div class="value">
                                <div class="input-group">
									
                                    <input class="input--style-5" type="number" name="other" value=""
                			min="0" step=".01"
                	required>
                                </div>
                            </div>
                        </div>
						<div class="form-row">
                            <div class="name">Deduction Description</div>
                            <div class="value">
                                <div class="input-group">
									
                                    <input class="input--style-5" type="text" name="deductionDescription" value=""
                	required>
                                </div>
                            </div>
                        </div>
						<div class="form-row">
                            <div class="name">Deduction Total</div>
                            <div class="value">
                                <div class="input-group">
									
                                    <input class="input--style-5" type="number" name="deductionTotal" value=""
                			min="0" step=".01"
                	required>
                                </div>
                            </div>
                        </div>
						<div class="form-row">
                            <div class="name">Total Earnings</div>
                            <div class="value">
                                <div class="input-group">
									
                                    <input class="input--style-5" type="number" name="TotalEarnings" value=""
                			min="0" step=".01"
                	required>
                                </div>
                            </div>
                        </div>
						<div class="form-row">
                            <div class="name">Net Salary</div>
                            <div class="value">
                                <div class="input-group">
									
                                    <input class="input--style-5" type="number" name="netPay" value=""
                			min="0" step=".01"
                	required>
                                </div>
                            </div>
                        </div>
                        <div>
							<input type="hidden" name="stat" size="45"value="<%=data[4]%>"/>
                            <button name ="action" class="btn btn--radius-2 btn--blue" type="submit" value="Save"> Save </button>
                        </div>
                    </form>
					<br>
					<a href="non_created_<%=data[4]%>.jsp">
					<button name ="action" class="btn btn--radius-2 btn--red" type="submit" value="Cancel">Cancel</button>
					</a>
			   </div>
            </div>
        </div>
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