<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" 
	href="https://fonts.googleapis.com/css?family=Roboto+Mono|Indie+Flower|Permanent+Marker|Text+Me+One|Oswald:bold">
	<title>Signup for Quiz</title>
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
				<div class="login100-pic" >
					<img src="assets/img/img-01.png" alt="IMG">
				</div>
				<form class="login100-form validate-form" method="post" action="signup">
					<span class="login100-form-title">
						Signup
					</span>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="name" placeholder="Name"/>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="number" name="phone" placeholder="Phone Number" value="91"/>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-phone" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email" placeholder="Email"/>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="username" placeholder="Username"/>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="password" placeholder="Password"/>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="SignUp"/>
					</div>

					<div class="text-center p-t-12">
						
						
						<div style="color:red">${sessionScope.alert}</div>	
					</div>

				</form>
			</div>
		</div>
	</div>
	
	



</body>
</html>