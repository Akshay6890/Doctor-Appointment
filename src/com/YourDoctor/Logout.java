package com.YourDoctor;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String referer;
		try {
			referer = new URI(request.getHeader("referer")).getPath();
		    String[] uriNames = referer.split("/");
		    String jspPageName = uriNames[uriNames.length-1];
		    HttpSession session  = request.getSession();
		    if(jspPageName.equals("patient"))
		    {
		    	session.removeAttribute("id");
		    	session.removeAttribute("pwd");
		    	session.invalidate();
		    	response.sendRedirect("index.jsp");
		    }
		    else if(jspPageName.equals("admin"))
		    {
		    	session.removeAttribute("admin_id");
		    	session.removeAttribute("admin_pwd");
		    	session.invalidate();
		    	response.sendRedirect("adminlogin.jsp");
		    }
		    else
		    {
		    	session.removeAttribute("doc_id");
		    	session.removeAttribute("doc_pwd");
		    	session.invalidate();
		    	response.sendRedirect("doctorlogin.jsp");
		    }
		} 
		catch (URISyntaxException e) {
			e.printStackTrace();
		}

	}


}
