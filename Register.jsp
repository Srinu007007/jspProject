<!-- Registration.jsp page-->


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
 <h3>Register here</h3>
 
	 
	 <!-- using registration creater or not and using javascript validation also -->
 <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
	 
 <form action="register" method="post">
	 
 <input type="text" name="name" placeholder="Enter your name" value=""><br>
 <input type="email" name="email" placeholder="Enter your E-mail" value=""><br>
 <input type="text" name="username" placeholder="Enter your Username" value=""><br>
 <input type="password" name="pwd" placeholder="Enter your Password" value=""><br>
 <input type="password" name="cpwd" placeholder="Enter your conform Password" value=""><br>
 <input type="submit" value="Register" name="Register"><br>
 <br>
 
 </form>
 <p>Do you have an account </p><a href="login.jsp">Login here......</a>
 
 </center>
	
 <!-- registration validation  -->
 <script>
  
 var status= document.getElementById("status").value;
 
 if(status=="sucess")
	 {
	 alert("Your Registration Successfully");
	 }
 
 </script>
	
</body>
</html>




-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


-> right click on "src/main/java"
-> click on "new" option
-> select the "package" option
-> type "com.uniquedeveloper.registration". click okay button
-> and right click on "com.uniquedeveloper.registration" and select the "servelt" option
-> and type the class name "RegistartionServelt"
-> click on ok button.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
open RegistartionServerlt.java 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


package com.uniquedeveloper.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistartionServlet
 */
@WebServlet("/register")//here register name should be same to from action name also 
public class RegistartionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

/* assigning values to the java code using request.getParameter() method here paramater should be same to html <input> tag "name" same

		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String username=request.getParameter("username");
	    String pwd=request.getParameter("pwd");

     //RequestDispatcher class used to move to one jsp page to another page

	    RequestDispatcher dispatcher=null;
    //Connection class  used to connect to mysql database
	    Connection con=null;
	    try
	    {
	    	Class.forName("com.mysql.cj.jdbc.Driver");  // driver name

                //here users is a database name and server name is root and and password is 1234 and server port number 3036
	    	 con= DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false","root","1234");

//here PreparedStatement class used to querey 
	    	PreparedStatement pst= con.prepareStatement("insert into users(name,email,username,password)values(?,?,?,?)");
	    	pst.setString(1, name);
	    	pst.setString(2, email);
	    	pst.setString(3, username);
	    	pst.setString(4, pwd);
	    	
//excuteUpdate() method used to query excute	

	    	int rowcount=pst.executeUpdate();

//moving one jsp page to another jsp page
	    	dispatcher=request.getRequestDispatcher("Register.jsp");
	    	if(rowcount>0)
	    	{
	    		request.setAttribute("status","sucess"); //moving value in html page using status
	    		
	    	}
	    	else {
	    		request.setAttribute("status","falied");  //moving value in html page using status
	    	}
	    	dispatcher.forward(request, response);
	    }
	    catch(Exception e) {
	    	
	    	e.printStackTrace();
	    	
	    }
	    finally {
	    	try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    
	}

}

