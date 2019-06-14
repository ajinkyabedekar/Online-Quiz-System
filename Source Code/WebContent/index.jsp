<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Model.DatabaseHelper"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Redirecting</title>
	<% 
	DatabaseHelper d;
	Object type=session.getAttribute("type");
	if(type!=null)
	{
		if(type.toString().equals("users"))
			response.sendRedirect("Dashboard.jsp");
		else
			response.sendRedirect("admin/Dashboard.jsp");
	}
	else
	{
		d=new DatabaseHelper();
		d.prepare();
		d.closeConnection();
		response.sendRedirect("login.jsp");
	}
	%>
</head>
<body>
Redirecting...
</body>
</html>