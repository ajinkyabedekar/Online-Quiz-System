<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Question</title>

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
		<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/quiz"
         user = "root"  password = "Bahu@123"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from category;
      </sql:query>
    <div class="main-panel">
		 <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Questions</a>
                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                 
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Add Questions</h4>
                            </div>
                            <hr>
                            <div class="content">
                                <form onsubmit="return validate()" name="form" method="post" action="${pageContext.request.contextPath}/aq">
                                    <div class="row">
                                    <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Category</label>
                                                <select class="form-control border-input"  name="select">
                                                	<c:forEach var = "row" items = "${result.rows}">
               											<option><c:out value = "${row.category_name}"/></option>
         											</c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label>Question</label>
                                                <textarea rows = "5" cols = "50" class="form-control border-input" name="textarea" placeholder="Type your Question"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                     <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Answer</label>
                                                  <input type="text" class="form-control border-input" name="opt1"  placeholder="Option 1"/>                                            
                                                  <input type="text" class="form-control border-input" name="opt2"  placeholder="Option 2"/>                                           
                                                  <input type="text" class="form-control border-input" name="opt3"  placeholder="Option 3"/>                                            
                                                  <input type="text" class="form-control border-input" name="opt4"  placeholder="Option 4"/>                                           
                                            </div>
                                        </div>
                                    </div>
                                     <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Correct Option</label>
                                                	<select class="form-control border-input" name="correct" >                                            
                                         				<option>1</option>
                                         				<option>2</option>
                                         				<option>3</option>
                                         				<option>4</option>
                                         			</select>
                                         </div>
                                        </div>
                                    </div>
                                    
                                    <div class="text-center">
                                        <button type="submit" class="btn">Add question</button>
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
    <script src="assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>
<script>
$(document).ready(function(){
	var message='${cookie.success.value}';
	if(message!='')
		alert(message);
});
	function validate(){
		var text=document.forms["form"]["textarea"].value;
		var o1=document.forms["form"]["opt1"].value;
		var o2=document.forms["form"]["opt2"].value;
		var o3=document.forms["form"]["opt3"].value;
		var o4=document.forms["form"]["opt4"].value;
		text=text.replace(/ /g, '');
		o1=o1.replace(/ /g, '');
		o2=o2.replace(/ /g, '');
		o3=o3.replace(/ /g, '');
		o4=o4.replace(/ /g, '');
		if(text=="")
		{
		alert("Question is reqired!");
		document.forms["form"]["textarea"].value="";		
		return false;
		}
		else if(o1=="")
		{
		alert("Enter Option 1");
		document.forms["form"]["opt1"].value="";
		return false;
		}
		else if(o2=="")
		{
		alert("Enter Option 2");
		document.forms["form"]["opt2"].value="";
		return false;
		}
		else if(o3=="")
		{
		alert("Enter Option 3");
		document.forms["form"]["opt3"].value="";
		return false;
		}
		else if(o4=="")
		{
		alert("Enter Option 4");
		document.forms["form"]["opt4"].value="";
		return false;
		}
	}
	 </script>
</html>
    