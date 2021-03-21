<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script src="js/admin.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">	
	</head>
	<header class="col-lg-12 well">
		<%
			HttpSession session_admin_check = request.getSession();
			String email_check_admin  = (String) session_admin_check.getAttribute("admin_id");
			String pwd_check_admin = (String) session_admin_check.getAttribute("admin_pwd");
			if(email_check_admin!=null && pwd_check_admin!=null){
		%>
				<div class="col-lg-offset-1 col-lg-3"><b class="logo">YourDoctor</b>Admin</div>
				<div class="col-lg-offset-7 col-lg-1"><form action="logout"><button type="submit" data-toggle="tooltip" title="Logout"><i class="fa fa-power-off fa-2x"></i></button></form></div>
		<%
			}
			else{
		%>
				<div class="col-lg-offset-1 col-lg-3"><b class="logo">YourDoctor</b>Admin</div>
				<div class="col-lg-offset-6 col-lg-1" id="header_links"><a href="adminlogin.jsp">LOGIN</a></div>
				<div class="col-lg-1" id="header_links"><a href="admin_signup.jsp">SIGN UP</a></div>
		<%
			}
		%>
	</header>
	
	
	
	
	
