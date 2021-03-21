<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
HttpSession session_admin = request.getSession();
String email  = (String) session_admin.getAttribute("admin_id");
String pwd = (String) session_admin.getAttribute("admin_pwd");
if(email!=null && pwd!=null){ 
%>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="java.sql.*" %>
<%@include file="adminheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<body>	
	<div class="container-fluid">
	  <div class="col-lg-3">
	    <ul>
	      <li><a onClick="profile()">Profile</a></li>
	      <li><a onClick="patients()">Users</a></li>
	      <li><a onClick="doctors()">Doctors</a></li>
	      <li><a onClick="appointments()">Appointments</a></li>
	    </ul>
	  </div>
	  <div class="col-lg-9 well" id="profile">
	  		<br><p class="overhead_text col-lg-offset-4 col-lg-4" style="text-align:center">Profile</p>
	  		<div class="col-lg-12">
				<%
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:Oracle","C##AKSHAY","123");
					Statement statement = con.createStatement();
					String query="SELECT * FROM admins WHERE email='"+email+"' AND password='"+pwd+"'";
					ResultSet stat=statement.executeQuery(query);
					if(stat.next())
					{
						out.println("Name  :  "+stat.getString("name")+"<br><br>");
						out.println("Email  :  "+stat.getString("email")+"<br><br>");
						out.println("Password  :  "+stat.getString("password")+"<br><br>");
						out.println("Gender  :  "+stat.getString("gender")+"<br><br>");
						out.println("Mobile Number  :  "+stat.getString("mobile_number")+"<br><br>");
					}
				%>
	  		</div>
	  </div>
	  <div class="col-lg-9 data_hidden" id="patients">
	  	<br><p class="overhead_text col-lg-offset-4 col-lg-4" style="text-align:center">Users List</p>
	    <div class="table-box">
    		<div class="table-row table-head ">
	      		<div class="table-cell left-alinging">
	        		<p>Name</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Email</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Gender</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Mobile Number</p>
	      		</div>
    		</div>
    		<%
				String query1="SELECT name,email,gender,mobile_number FROM patients";
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
	      		<div class="table-cell left-alinging">
	        		<p><%=patients.getString(4)%></p>
	      		</div>
    		</div>
    		<%
				}
    		%>
    	</div>
    </div>
    <div class="col-lg-9 data_hidden" id="doctors">
	  	<br><p class="overhead_text col-lg-offset-4 col-lg-4" style="text-align:center">Doctors List</p>
	    <div class="table-box">
    		<div class="table-row table-head ">
	      		<div class="table-cell left-alinging">
	        		<p>Name</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Email</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Specialization</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Mobile Number</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Hospital</p>
	      		</div>
    		</div>
    		<%
				String query2="SELECT name,email,type,mobile_number,hospital FROM doctors";
				ResultSet doctors = statement.executeQuery(query2);
				while(doctors.next())
				{
    		%>
    		<div class="table-row">
	      		<div class="table-cell left-alinging">
	        		<p><%=doctors.getString(1)%></p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p><%=doctors.getString(2)%></p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p><%=doctors.getString(3)%></p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p><%=doctors.getString(4)%></p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p><%=doctors.getString(5)%></p>
	      		</div>
    		</div>
    		<%
				}
    		%>
    	</div>
    </div>
    <div class="col-lg-9 data_hidden" id="appointments">
    		  		  	<br><p class="overhead_text col-lg-offset-4 col-lg-4" style="text-align:center">Appointments</p>
	    <div class="table-box">
    		<div class="table-row table-head ">
	      		<div class="table-cell left-alinging">
	        		<p>Doctor Name</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Doctor Email</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Specialization</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Hospital</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Date</p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p>Time</p>
	      		</div>
    		</div>
    		<%
				String query3="SELECT doctor_name,doctor_email,type,hospital,appointment_date,appointment_time FROM appointments";
				ResultSet apps = statement.executeQuery(query3);
				while(apps.next())
				{
    		%>
    		<div class="table-row">
	      		<div class="table-cell left-alinging">
	        		<p><%=apps.getString(1)%></p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p><%=apps.getString(2)%></p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p><%=apps.getString(3)%></p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p><%=apps.getString(4)%></p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p><%=apps.getString(5)%></p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p><%=apps.getString(6)%></p>
	      		</div>
    		</div>
    		<%
				}
    		%>
    	</div>
    	</div>
   </div>
</body>
</html>
<%
}
else{
	response.sendRedirect("adminlogin.jsp");
}
%>