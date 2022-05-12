
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
-> right click on "com.uniquedeveloper.registration" and select the "servelt" option
-> and type the class name "logout"
-> click on ok button.
  
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------

  
 ------------------------------------------------------------------LOOUT.JAVA-------------------------------------------------------------------------------------------
  
  package com.uniquedeveloper.registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logout
 */
@WebServlet("/logout") // here logout name and <a href="logout"> should be same
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    //session class create
		HttpSession session= request.getSession();
    //here session totally closed
		session.invalidate();
    
    //moving to first .jsp page
	  response.sendRedirect("login.jsp");
	}

	

}
