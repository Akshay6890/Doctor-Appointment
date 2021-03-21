<%@page language="java" import="java.util.*" %>
<%@page language="java" import="java.sql.*" %>
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
	<body>
	<p style="font-size:30px; font-family:Bahnschrift Light; align:center">APPOINTMENT FORM</p>
	<br><br>
	<form action="appointment" method="post">
  		<label> Specialist </label>
		<select id="types" name="specialist">
			<option value="Physician">Physician</option>
		</select>
		<label> Doctor </label>
		<select id="doctors" name="doctor" onchange="dat()">
			<option value="Vasu">Vasu</option>
			<option value="Rajesh Khanna">Rajesh Khanna</option>
			<option value="Surya Narayan">Surya Narayan</option>
		</select>
		<label> Date </label>
		<select id="dates" name="date">
			<option value="" selected disabled>Select Date</option>
		</select>
		<label> Time </label>
		<select name="time">
			<option value="10:00 - 10:30 am">10:00-10:30 am</option>
			<option value="10:30 - 11:00 am">10:30-11:00 am</option>
			<option value="11:00 - 11:30 am">11:00-11:30 am</option>
			<option value="11:30 - 12:00 am">11:30-12:00 am</option>
			<option value="12:00 - 12:30 pm">12:00-12:30 pm</option>
			<option value="12:30 - 13:00 pm">12:30-13:00 pm</option>
			<option value="13:00 - 13:30 pm">13:00-13:30 pm</option>
			<option value="13:30 - 14:00 pm">13:30-14:00 pm</option>
			<option value="14:00 - 14:30 pm">14:00-14:30 pm</option>
			<option value="14:30 - 15:00 pm">14:30-15:00 pm</option>
			<option value="15:00 - 15:30 pm">15:00-15:30 pm</option>
			<option value="15:30 - 16:00 pm">15:30-16:00 pm</option>
			<option value="16:00 - 16:30 pm">16:00-16:30 pm</option>
			<option value="16:30 - 17:00 pm">16:30-17:00 pm</option>
		</select>		
		&emsp; &emsp;<input class="btn" type="submit" value="Make Appointment"><br>
		<%
			String msg= (String) request.getAttribute("msg");
			if(msg!=null){
				out.println(msg);
			}
		%>
	</form>
	</body>
	</html>
	
	
	
	
	
	
	
	