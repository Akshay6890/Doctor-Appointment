package com.YourDoctor;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Appointment extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		String msg,doc_e,doc_h,user_name,user_email,doc_n,type,app_date,app_time;
		user_email = (String) session.getAttribute("id");
		app_date = request.getParameter("date");
		app_time = request.getParameter("time");
		doc_n = request.getParameter("doctor");
		type=request.getParameter("specialist");
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:Oracle","C##AKSHAY","123");
			Statement statement = con.createStatement();
			
			String query1 = "SELECT email,hospital FROM doctors WHERE name='"+(String) request.getParameter("doctor")+"'";
			ResultSet rs = statement.executeQuery(query1);
			
			if(rs.next()) { 
				doc_e = rs.getString("email");
				doc_h = rs.getString("hospital");
				PreparedStatement pst = con.prepareStatement("INSERT INTO appointments VALUES(?,?,?,?,?,?,?)");
				pst.setNString(1,user_email);
				pst.setNString(2,doc_n);
				pst.setNString(3,doc_e);
				pst.setNString(4,type);
				pst.setNString(5,doc_h);
				pst.setNString(6,app_date);
				pst.setNString(7,app_time);
				int i=pst.executeUpdate();
				if(i>0) {
					msg="Success!";
					request.setAttribute("msg",msg);
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("/appointment.jsp");
				    requestDispatcher.forward(request, response);
					}
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
