<%@include file="adminheader.jsp" %>
	<body style="background-image:url('images/bg.png'); background-repeat:no-repeat">
		<form action="admin" method="post" class="col-lg-offset-4 col-lg-4">
			<br><br><br><br><br><br>
			<p class="col-lg-offset-4 col-lg-4 login_text">Login</p>
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
			<input class="form-control" type="text" name="email" placeholder="Email or Username"><br>
			<input class="form-control" type="password" name="pwd" placeholder="Password"><br>
			<div class="col-lg-offset-4 col-lg-4"><button class="form-control" type="submit" name="login">Login</button><br><br><br><br>
			<br><br><br><br></div>
		</form>
	</body>
<%@include file="footer.jsp" %>
</html>