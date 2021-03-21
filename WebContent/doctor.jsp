<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
HttpSession session_doctor = request.getSession();
String email  = (String) session_doctor.getAttribute("doc_id");
String pwd = (String) session_doctor.getAttribute("doc_pwd");
if(email!=null && pwd!=null){
%>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="java.sql.*" %>
<%@include file="doctorheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<body>
	<div class="container">
		<div class="col-lg-3">
	    	<ul>
	      		<li><a onClick="profile()">Profile</a></li>
	      		<li><a onClick="list()">Patients List</a></li>
	      		<!--<li><a onClick="history()">History</a></li>-->
	    	</ul>
	  	</div>
	  	<div class="col-lg-9 well" id="profile">
	  		<br><p class="overhead_text col-lg-offset-4 col-lg-4" style="text-align:center">Profile</p>
	  		<div class="col-lg-12">
				<%
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:Oracle","C##AKSHAY","123");
					Statement statement = con.createStatement();
					String query="SELECT * FROM doctors WHERE email='"+email+"' AND password='"+pwd+"'";
					ResultSet stat=statement.executeQuery(query);
					if(stat.next())
					{
						out.println("Name  :  "+stat.getString("name")+"<br><br>");
						out.println("Email  :  "+stat.getString("email")+"<br><br>");
						out.println("Gender  :  "+stat.getString("gender")+"<br><br>");
						out.println("Password  :  "+stat.getString("password")+"<br><br>");
						out.println("Specialization  :  "+stat.getString("type")+"<br><br>");
						out.println("Mobile Number  :  "+stat.getString("mobile_number")+"<br><br>");
						out.println("Hospital  :  "+stat.getString("hospital")+"<br><br>");
					}
				%>
	  		</div>
	  	</div>
	  	<div class="col-lg-9 data_hidden" id="list">
	  		  	<br><p class="overhead_text col-lg-offset-4 col-lg-4" style="text-align:center">My Appointments</p>
	    <div class="table-box">
    		<div class="table-row table-head ">
	      		<div class="table-cell left-alinging">
	        		<p>Patient Email</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Appointment Date</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Appointment Time</p>
	      		</div>
    		</div>
    		<%
				String query1="SELECT patient_email,appointment_date,appointment_time FROM appointments WHERE doctor_email='"+(String) session.getAttribute("doc_id")+"'";
				ResultSet patients = statement.executeQuery(query1);
				while(patients.next())
				{
    		%>
    		<div class="table-row">
	      		<div class="table-cell left-alinging">
	        		<p><%=patients.getString(1)%></p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p><%=patients.getString(2)%></p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p><%=patients.getString(3)%></p>
	      		</div>
    		</div>
    		<%
				}
    		%>
    	</div>
	  	<div class="col-lg-9 well data_hidden" id="history">
	  		<br><br><br><br><br><br><br>
	  	</div>
	</div>
	</div>
</body>
</html>
<%
}
else{
	response.sendRedirect("doctorlogin.jsp");
}
%>