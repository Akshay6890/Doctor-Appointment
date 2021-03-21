<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script src="js/user.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">	
	</head>
	<header class="col-lg-12 well">
		<%
			HttpSession session_user = request.getSession();
			String email_check  = (String) session_user.getAttribute("id");
			String pwd_check = (String) session_user.getAttribute("pwd");
			if(email_check==null || pwd_check==null){
		%>
				<div class="col-lg-offset-1 col-lg-2 logo"><b>YourDoctor</b></div>
				<div class="col-lg-offset-7 col-lg-1" id="header_links"><a href="index.jsp">LOGIN</a></div>
				<div class="col-lg-1" id="header_links"><a href="patient_signup.jsp">SIGN UP</a></div>
		<%
			}
			else{
		%>
				<div class="col-lg-offset-1 col-lg-3 logo"><b>YourDoctor</b></div>
				<div class="col-lg-offset-7 col-lg-1"><form action="logout"><button type="submit" data-toggle="tooltip" title="Logout"><i class="fa fa-power-off fa-2x"></i></button></form></div>
		<%
			}
		%>
	</header>

	
	
	
	
	
	