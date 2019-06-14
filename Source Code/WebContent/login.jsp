<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<% 
	Object type=session.getAttribute("type");
	if(type!=null)
	{
		if(type.toString().equals("users"))
			response.sendRedirect("Dashboard.jsp");
		else
			response.sendRedirect("admin/Dashboard.jsp");
	}
	%>
	<title>Login</title>
	<link rel="stylesheet" 
	href="https://fonts.googleapis.com/css?family=Roboto+Mono|Indie+Flower|Permanent+Marker|Text+Me+One|Oswald:bold">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="assets/js/main.js"></script>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="assets/img/favicon.png"/>
<!--===============================================================================================-->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/css/util.css">
	<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
		
			<div>
			<div style="font-family: 'Oswald', serif;font-size:40px;">ONLINE QUIZ SYSTEM</div>		
				<div class="login100-pic">
					<img src="assets/img/img-01.png" alt="IMG">
				</div>
				<form class="login100-form validate-form" method="POST" action="auth">
					<span class="login100-form-title">
						Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email" placeholder="Email"/>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" placeholder="Password"/>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="Login"/>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a><br><br>
						<div style="color:red">${cookie.alert.value}</div>	
					</div>

					<div class="text-center">
						<a class="txt2" href="Signup.jsp">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	



</body>
</html>