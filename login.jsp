
<!-- ******************************************************* Login.jsp ******************************************************** -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<!-- used to hidden input tag using login valiadation  -->
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>>">
<form action="login" method="post">
<h3> Login here...</h3>


<input type="text" name="username" value="" placeholder="Enter your username"><br>
<input type="password" name="pwd" value="" placeholder="Enter your password"><br>
<input type="submit" value="Login" name="login"><br>

</form>
 <p>Do you have not  an account </p><a href="Register.jsp">Register here......</a>

</center>
<!-- valadation here-->
<script>
var check= document.getElementById("status").value;

if(check=="falied"){
	alert("your username or password wrong");
}

</script>
</body>
</html>



----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-> right click on "com.uniquedeveloper.registration" and select the "servelt" option
-> and type the class name "Login"
-> click on ok button.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
Open login.java
----------------------------------------------------------------------------------------------------------------------------------------------------------------------


package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login") //  here login name should be same to login form action name
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
/* Reading values in login.jsp page*/
   String username= request.getParameter("username");
		String pwd=request.getParameter("pwd");


	//	RequestDispatcher class used to moving one page to another page
		RequestDispatcher dispatcher=null;

// creating session using pass values
		HttpSession session= request.getSession();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
//Connection to mysql database 
	    	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false","root","1234");
	    	
//retrivery  query here 
	    	PreparedStatement pst= con.prepareStatement("select * from users where email=? and password =?");
	    	
	    	pst.setString(1, username);
	    	pst.setString(2, pwd);
	    	
//execute the retrive query
	    	ResultSet rs= pst.executeQuery();
//checking 	    	
	    	if(rs.next()) {
	    		session.setAttribute("name",rs.getString("username"));  //using this statement passing the value in to next jsp page 
	    		dispatcher = request.getRequestDispatcher("index.jsp"); // moving next jsp page
	    		
	    	}
	    	else {
	    		request.setAttribute("status", "falied"); //using this statement invalid username and password && status value move to jsp page also
	    		dispatcher= request.getRequestDispatcher("login.jsp"); // same jsp page calling here
	    	}
	    	dispatcher.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
	    	
			
		}
		
	}

}
