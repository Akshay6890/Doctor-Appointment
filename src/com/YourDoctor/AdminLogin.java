package com.YourDoctor;
import java.io.IOException;

import java.io.PrintWriter;
import java.sql.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String msg="";
		HttpSession session = request.getSession();
		if(email.equals("") || pwd.equals("")) {
			msg="Please fill in all fields";
			request.setAttribute("msg",msg);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/adminlogin.jsp");
            requestDispatcher.forward(request, response);
		}
		else {
			PrintWriter out = response.getWriter();
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:Oracle","C##AKSHAY","123");
				Statement statement = con.createStatement();
				String query="SELECT * FROM admins WHERE email='"+email+"' AND password='"+pwd+"'";
				ResultSet stat=statement.executeQuery(query);
				if(stat.next()) {
					session.setAttribute("admin_id",email);
					session.setAttribute("admin_pwd", pwd);
		            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin.jsp");
		            requestDispatcher.forward(request, response);
				}
				else {
					msg="Email or password Incorrect";
					request.setAttribute("msg",msg);
		            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/adminlogin.jsp");
		            requestDispatcher.forward(request, response);
				}
			}
			catch(Exception e) {
				out.println("Fail");
				e.printStackTrace();
			}
		}
		
	}
}
