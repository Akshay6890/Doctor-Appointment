package com.YourDoctor;

import java.io.IOException;

import java.io.PrintWriter;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.*;
import java.lang.String.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoctorVerify extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		try {
			String referer = new URI(request.getHeader("referer")).getPath();
		    String[] uriNames = referer.split("/");
		    String jspPageName = uriNames[uriNames.length-1];
		    if(jspPageName.equals("doctor_signup.jsp") || jspPageName.equals("doctor_signup")) {
		    	
		    	
		    	String email,pwd,name,gender,phone,msg,hospital,type;
		    	email = request.getParameter("email");
		    	pwd = request.getParameter("pwd");
		    	name = request.getParameter("uname");
		    	gender = request.getParameter("gender");
		    	phone = request.getParameter("phone");
		    	hospital = request.getParameter("hospital");
		    	type = request.getParameter("type");
		    	Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:Oracle","C##AKSHAY","123");
				Statement statement = con.createStatement();
				if(email.equals("") || pwd.equals("") || name.equals("") || (gender==null) ||  phone.equals("") || (hospital==null) || (type==null))
				{
					msg="Please Fill in all the fields";
					request.setAttribute("msg", msg);
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("/doctor_signup.jsp");
				    requestDispatcher.forward(request, response);
				}
				else {
					String query="SELECT * FROM doctors WHERE email='"+email+"'";
					ResultSet stat=statement.executeQuery(query);
					if(stat.next()) {
						msg="Email already exists";
						request.setAttribute("msg", msg);
						RequestDispatcher requestDispatcher = request.getRequestDispatcher("/doctor_signup.jsp");
					    requestDispatcher.forward(request, response);
					}
					else {
						PreparedStatement pst = con.prepareStatement("INSERT INTO doctors VALUES(?,?,?,?,?,?,?)");
						pst.setNString(1, name);
						pst.setNString(2, email);
						pst.setNString(3, gender);
						pst.setNString(4, pwd);
						pst.setNString(5, type);
						pst.setNString(6, phone);
						pst.setNString(7, hospital);
						int i=pst.executeUpdate();
						if(i>0)
						{
							msg="SignUp Successful Goto Login Page";
							request.setAttribute("msg", msg);
							RequestDispatcher requestDispatcher = request.getRequestDispatcher("/doctor_signup.jsp");
							requestDispatcher.forward(request, response);
						}
					}
				}
		    }
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
