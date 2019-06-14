<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Category</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="../assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="../assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="../assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>

<div class="wrapper">
		<%@ include file="nav.html" %>
    <div class="main-panel">
		 <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Category</a>
                </div>
            </div>
        </nav>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                 
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Add Category</h4>
                            </div>
                            <hr>
                            <div class="content">
                                <form name="form" onsubmit="return validate()" method="post" action="${pageContext.request.contextPath}/addcat">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>New Category</label>
                                                <input type="text" class="form-control border-input" name="cat"  placeholder="Type category name"/>                                            
                                                </div>
                                        </div>
                                    </div>
                                     <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Maximum time(min)</label>
  												<select class="form-control border-input"  name="time">
                                                	<option>30</option>
                                                	<option>45</option>
                                                	<option>60</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                      <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Instruction</label>
                                                <input type="text" class="form-control border-input" name="inst"  placeholder="(optional)"/>                                            
                                                </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn">Add Category</button>
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>


				       <%@include file="footer.html" %>				        
    </div>
</div>


</body>
	
    <!--   Core JS Files   -->
    <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="../assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="../assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="../assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="../assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="../assets/js/demo.js"></script>
<script>
	$(document).ready(function(){
		var message='${cookie.success.value}';
		if(message!='')
			alert(message);
	});
	function validate(){
		var cat=document.forms["form"]["cat"].value;
		cat=cat.replace(/ /g, '');
		if(cat=="")
			{
			alert("Category name is reqired!");
			document.forms["form"]["cat"].value="";
			return false;
			}
	}
	 </script>
</html>
    