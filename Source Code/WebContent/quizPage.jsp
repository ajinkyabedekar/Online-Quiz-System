<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Quiz</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<link rel="stylesheet" type="text/css" href="assets/css/util.css">
<link rel="stylesheet" type="text/css" href="assets/css/main.css">

<!-- Bootstrap core CSS     -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="assets/css/paper-dashboard.css" rel="stylesheet" />


<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/quiz" user="root" password="Bahu@123" />

	<sql:query dataSource="${snapshot}" var="result">
select * from questions,solutions,category where questions.q_no=solutions.q_no and questions.category_id=(select category_id from category where category_name='${sessionScope.cat }') and category.category_name='${sessionScope.cat }';
      </sql:query>

	<div class="panel-quiz">
		<nav class="navbar navbar-default2">
			<div class="container-fluid">
				<div class="navbar-header">
					<h3 class="title">
						<b>${sessionScope.cat} Questions</b>
					</h3>
					<h6>${result.rows[1].instruction}</h6>
				</div>
				<div class="collapse navbar-collapse"></div>
			</div>
		</nav>
		<%!int i = 0;%>
		<div style="padding: 10px; color: black;">
			Complete in: <b id="demo"></b>
		</div>

		<div class="content">
			<div class="container-fluid">

				<div class="col-md-12">
					<div class="card">
						<div class="header"></div>
						<br>
						<form onsubmit="return check()" name="forms" action="result"
							method="post">
							<div class="content">
								<c:forEach var="row" items="${result.rows}">
									<%
										i++;
									%>
									<p><%=i%>.${row.question}
									</p>
									<input type="radio" name="q<%=i%>" value="1" />
									<span class="checkmark"></span>
									<label class="containerRadio">${row.opt1} </label>
									<br>
									<input type="radio" name="q<%=i%>" value="2" />
									<span class="checkmark"></span>
									<label class="containerRadio">${row.opt2} </label>
									<br>
									<c:if test="${!(row.opt3 eq 'null')}">
										<input type="radio" name="q<%=i%>" value="3" />
										<span class="checkmark"></span>
										<label class="containerRadio">${row.opt3} </label>
										<br>
										<input type="radio" name="q<%=i%>" value="4" />
										<span class="checkmark"></span>
										<label class="containerRadio">${row.opt4} </label>
									</c:if>

									<br>
									<br>
								</c:forEach>
								<br> <br>
								<%
									session.setAttribute("num", i);
									i = 0;
								%>
								<div class="footer"></div>
								<input type="submit" value="Submit" class="submit-btn" />

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="footer.html"%>


	</div>


</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script src="assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>

<script>
	var n;
	$(document).ready(function() {
		if ('${cookie.score.value}' != '') {
			alert("Your score is "+'${cookie.score.value}');
			location.href="Dashboard.jsp";
		}
		else if ('${result.rows[0].q_no}' != '')
			timer();
		else
		{
			alert("Nothing here!");
			location.href="Dashboard.jsp";
		}
	});
	function check() {
		var i, c = parseInt('${sessionScope.num}'), s;
		console.log(c);
		for (i = 1; i <= c; i++) {
			s = 'input[name=q' + i + ']:checked';
			if (typeof $(s).val() === "undefined") {
				alert("Please select options");
				return false;
			}
		}
		return true;
	}
	function timer() {
		var minutes = parseInt('${result.rows[0].max_time}') - 1;
		var seconds = 59;
		var x = setInterval(function() {
			if (seconds == -1) {
				minutes--;
				seconds = 59;
			}
			if (minutes == -1) {
				clearInterval(x);
				alert("Time Expired");
				document.getElementById("demo").innerHTML = "Time Expired";
			}
			document.getElementById("demo").innerHTML = minutes + "m "
					+ seconds + "s ";
			seconds--;

		}, 1000);
	}
</script>
</html>