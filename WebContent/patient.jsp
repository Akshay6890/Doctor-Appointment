<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
HttpSession session_patient = request.getSession();
String email  = (String) session_patient.getAttribute("id");
String pwd = (String) session_patient.getAttribute("pwd");
if(email!=null && pwd!=null){
%>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<body>
	<script>
  		function resizeIframe(obj) {
    		obj.style.height = obj.contentWindow.document.documentElement.scrollHeight + 'px';
  		}
	</script>
	<div class="container-fluid">
	  <div class="col-lg-3">
	    <ul>
	      <li><a onClick="profile()">Profile</a></li>
	      <li><a onClick="appointment()">Appointment</a></li>
	      <li><a onClick="list()">My Appointments</a></li>
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
					String query="SELECT * FROM patients WHERE email='"+email+"' AND password='"+pwd+"'";
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
	  <iframe class="col-lg-9 data_hidden frame_dim" id="appointment" src="appointment.jsp" frameBorder="0" scrolling="no" onload="resizeIframe('this')">
	  </iframe>
	  <div class="col-lg-9 well data_hidden" id="list">
	  		  	<br><p class="overhead_text col-lg-offset-4 col-lg-4" style="text-align:center">My Appointments</p>
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
				String query1="SELECT doctor_name,doctor_email,type,hospital,appointment_date,appointment_time FROM appointments WHERE patient_email='"+(String) session.getAttribute("id")+"'";
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
	      		<div class="table-cell left-alinging">
	        		<p><%=patients.getString(5)%></p>
	      		</div>
	      		<div class="table-cell left-alinging">
	        		<p><%=patients.getString(6)%></p>
	      		</div>
    		</div>
    		<%
				}
    		%>
    	</div>
	  </div>
	  <div class="col-lg-9 well data_hidden" id="history"></div>
   </div>
</body>
</html>
<%
}
else
{
	response.sendRedirect("index.jsp");
}
%>