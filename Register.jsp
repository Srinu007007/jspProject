<!-- Register.jsp html code here -->


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
 <form action="register" method="post">
 <input type="text" name="name" placeholder="Enter your name" value=""><br>
 <input type="email" name="email" placeholder="Enter your E-mail" value=""><br>
 <input type="text" name="username" placeholder="Enter your Username" value=""><br>
 <input type="password" name="pwd" placeholder="Enter your Password" value=""><br>
 <input type="password" name="cpwd" placeholder="Enter your conform Password" value=""><br>
 <input type="submit" value="Register" name="Register"><br>
 <br>
 
 <p>Do you have an account </p><a href="login.jsp">Login here......</a>
 
 
 
 
 </form>
 
 
 </center>
</body>
</html>


----------------------------------------------------------------------------------------------------------------------------------------------------------------



-> right click on "src/main/java"
-> click on "new" option
-> select the "package" option
-> type "com.uniquedeveloper.registration". click okay button
-> and right click on "com.uniquedeveloper.registration" and select the "servelt" option
-> and type the class name "RegistartionServelt"
-> click on ok button.


open RegistartionServerlt.java 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
@WebServlet("/register") // here html lo action name same ga undali 
public class RegistartionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");//here html lo unnanaa name same ga undali
		String email=request.getParameter("email");
		String username=request.getParameter("username");
	    String pwd=request.getParameter("pwd");
	    RequestDispatcher dispatcher=null;
	    Connection con=null;//connection var
	    try
	    {
	    	Class.forName("com.mysql.cj.jdbc.Driver");//driver open 
	    	 con= DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","1234");  //connection with mysql database name = users and server name="root" and password="1234"
	    	PreparedStatement pst= con.prepareStatement("insert into users(name,email,username,password)values(?,?,?,?)");//table insert querty
        //passing values here
        pst.setString(1, name);
	    	pst.setString(2, email);
	    	pst.setString(3, username);
	    	pst.setString(4, pwd);
	    	
	    	//row count excuteupadate method
	    	int rowcount=pst.executeUpdate();
       
	    	dispatcher=request.getRequestDispatcher("Register.jsp");  //after excute code and query and move to next jsp page
	    	if(rowcount>0)//checking query
	    	{
	    		request.setAttribute("status","sucess");
	    		
	    	}
	    	else {
	    		request.setAttribute("status","falied");
	    	}
	    	dispatcher.forward(request, response);//moving page 
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
