<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	

<html>

<head>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>Login</title>

	<link rel="stylesheet" href="assets/css/login.css">

  
</head>

<body>

	<form action="LoginServlet" method="post">


		<div class="login-box">
		
			<h1>Login</h1>
			
			<div class="textbox">
				<input type="text" name="username" id="userId" placeholder="Username" value="" required>
			</div>
			
			
			<div class="textbox">
				<input type="password" name="password" id="pwd" placeholder="Password" value="" required>
			</div>
			
			
			
			
			<br/>
			<br/> 
			
			
			<input class="btn" type="submit" name="user" value="Sign in">


		</div>
		
	</form>
	
</body>

</html>