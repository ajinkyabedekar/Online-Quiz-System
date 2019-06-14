<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!doctype html>
<html lang="en">
<head>
<%
	if (session.getAttribute("name") == null)
		response.sendRedirect("../login.jsp");
%>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="../assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Quiz Dashboard</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="../assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="../assets/css/paper-dashboard.css" rel="stylesheet" />

<!--  Fonts and icons     -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="../assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>

	<div class="wrapper">

		<%@ include file="nav.html"%>
		
		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/quiz" user="root"
			password="Bahu@123" />

		<sql:query dataSource="${snapshot}" var="cate">
        SELECT count(*) as c_count from category;
      </sql:query>
		<sql:query dataSource="${snapshot}" var="users">
        SELECT count(*) as user_count from users;
      </sql:query>
		<sql:query dataSource="${snapshot}" var="ques">
        SELECT count(*) as ques_count from questions;
      </sql:query>
		<div class="main-panel">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">Welcome! ${sessionScope.name}</a>
					</div>
					<div class="collapse navbar-collapse"></div>
				</div>
			</nav>


			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-4 col-sm-6">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<b>Users</b>
										</div>
										<div class="col-xs-7">
											<div class="numbers">${users.rows[0].user_count == null?0:users.rows[0].user_count}</div>
										</div>
									</div>
									<div class="footer">
										<hr />
										<div class="stats">
											<i class="ti-reload"></i> Updated now
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<b>Categories</b>
										</div>
										<div class="col-xs-7">
											<div class="numbers">${cate.rows[0].c_count==null?0:cate.rows[0].c_count }</div>
										</div>
									</div>
									<div class="footer">
										<hr />
										<div class="stats">
											<i class="ti-reload"></i> Updated now
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<b>Questions logged</b>
										</div>
										<div class="col-xs-7">
											<div class="numbers">${ques.rows[0].ques_count==null?0:ques.rows[0].ques_count }</div>
										</div>
									</div>
									<div class="footer">
										<hr />
										<div class="stats">
											<i class="ti-reload"></i> Updated now
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>


			<%@include file="footer.html"%>

		</div>
	</div>


</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

	});
</script>

</html>
