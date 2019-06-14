<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!doctype html>
<html lang="en">
<head>
<%
	if (session.getAttribute("name") == null)
		response.sendRedirect("login.jsp");
%>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>User Dashboard</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="assets/css/paper-dashboard.css" rel="stylesheet" />

<!--  Fonts and icons     -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>

	<div class="wrapper">

		<%@ include file="nav.html"%>

		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/quiz" user="root"
			password="Bahu@123" />

		<sql:query dataSource="${snapshot}" var="result">
        SELECT * from category;
      </sql:query>
		<sql:query dataSource="${snapshot}" var="stat">
        SELECT count(*) as attempt,sum(score) as score,avg(accuracy) as acc from scores where username='${sessionScope.username}';
      </sql:query>

		<div class="main-panel">
			<nav class="navbar navbar-default ">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">Welcome ${sessionScope.name}</a>
					</div>
					<div class="collapse navbar-collapse"></div>
				</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-3 col-sm-6">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<b>Quiz Attempted</b>
										</div>
										<div class="col-xs-7">
											<div class="numbers">${stat.rows[0].attempt }</div>
										</div>
									</div>

								</div>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<b>Right Answers</b>
										</div>
										<div class="col-xs-7">
											<div class="numbers">${stat.rows[0].score == null ? 0 : stat.rows[0].score }</div>
										</div>
									</div>

								</div>
							</div>
						</div>

						<div class="col-lg-3 col-sm-6">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<b>Accuracy</b>
										</div>
										<div class="col-xs-7">
											<div class="numbers">${stat.rows[0].acc == null ? 0 : stat.rows[0].acc}%</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="row">

						<div class="col-md-8">
							<div class="card">
								<div class="header">
									<h4 class="title">Performance</h4>
								</div>
								<div class="content">
									<div id="chartHours" class="ct-chart"></div>
									<div class="footer">
										<div class="chart-legend">
											<i class="fa fa-circle text-info"></i>
										</div>

									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">
								<form action="cat" method="get">
									<div class="header">
										<h4 class="title">Attempt Quiz Now</h4>
										<hr>
										<div class="col-md-12">
											<div class="form-group">
												<label>Choose Category</label> <select
													class="form-control border-input" id="cat" name="cat">
													<c:forEach var="row" items="${result.rows}">
														<option><c:out value="${row.category_name }" /></option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="container-login100-form-btn">
											<input type="submit" class="login100-form-btn"
												value="Attempt" />
										</div>
									</div>
								</form>
								<div class="content"></div>
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

<script src="assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

	});
</script>

</html>
