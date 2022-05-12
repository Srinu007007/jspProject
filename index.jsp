<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!-- session variable creation and check sessioon creater or not -->
    <%
   if(session.getAttribute("name")==null){
	   response.sendRedirect("login.jsp");
   }
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<!-- here href="logout" using session close and logout the page also logout name used to logout.java page-->
<a href="logout"> Logout </a>
<h1>

<CENTER><b>HOME PAGE</b></h1>
<!--   calling backend values using sessions-->
<b> <%= session.getAttribute("name") %>  </b>

</CENTER>





</body>
</html>
