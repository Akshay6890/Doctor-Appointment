<%@include file="doctorheader.jsp" %>
	<body style="background-image:url('images/bg.png'); background-repeat:no-repeat">
		<form action="doctor_signup" method="post" class="col-lg-offset-4 col-lg-4">
			<br>
			<p class="col-lg-offset-4 col-lg-4 login_text">Signup</p>
			<p class="col-lg-12" style="text-align:center">
				<% 
					String msg = (String) request.getAttribute("msg");
					if(msg==null)
					{
						out.println("");	
					}
					else
					{
						out.println(msg);
					}
				%>
			</p>
			<input class="form-control" type="text" name="uname" placeholder="Username"><br>
			<input class="form-control" type="text" name="email" placeholder="Email"><br>
			<input class="form-control" type="password" name="pwd" placeholder="Password"><br>
			<select name="gender" class="form-control">
				<option value="" disabled selected>Select Gender</option>
				<option value="Male">Male</option>
				<option value="Female">Female</option>
			</select><br>
			<select name="hospital" class="form-control">
				<option value="" disabled selected>Select Hospital</option>
				<option value="ABC">ABC</option>
				<option value="Orange">Orange</option>
			</select><br>
			<select name="type" class="form-control">
				<option value="" disabled selected>Select Specialization</option>
				<option value="Physician">Physician</option>
				<option value="Cardiologist">Cardiologist</option>
			</select><br>
			<input class="form-control" type="text" name="phone" placeholder="Mobile Number"><br>
			<div class="col-lg-offset-4 col-lg-4"><button class="form-control" type="submit" name="signup">Signup</button><br><br><br></div>
		</form>
	</body>
<%@include file="footer.jsp" %>
</html>