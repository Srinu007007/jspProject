
************************************ creation Folder ****************************

-> Right click on "webapp" and  select "New" option
-> Select the "New folder" option
-> type required name into the folder name for example "image" click okay button


********************************************************************************


*******************************************************************   Create imageinsert.jsp page   ****************************************************************


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


<h1>Upload image here...</h1><br>
<br>
<form action="addImage" method="post" enctype="multipart/form-data"> <!-- must by type enctype="multipart/form-data" -->
<input type="file" name="image"><br><br>
<br>

<input type="submit" value="Upload Image">


</form>


</center>
</body>
</html>


---------------------------------------------------------------------------------------------------------------------------------------------------------------

-> Right click on "com.uniquedeveloper.regstration"
-> select new option and select the "servelt" option
-> Type the "addImage" and click okay button.

---------------------------------------------------------------------------------------------------------------------------------------------------------------


******************************************** open addImage.java ********************************************************************************************

package com.uniquedeveloper.registration;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig  //must be import for image and multimedia process

@WebServlet("/addImage") // here addImage must be same form action name
public class addImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Part file= request.getPart("image");  //here image name must be same input tag image name same
		
		String imageFileName= file.getSubmittedFileName(); 
		
		String uploadPath="C:/Users/STUDENT/eclipse-workspace/RegisterAndLogin/src/main/webapp/images"+imageFileName; //here path is webapp open and select the image folder and right click it and select the properties options and copy the path

		
		System.out.println("file fask"+uploadPath); //checking working or not
   
/*	below the code move the image into the creating image folder */	
		try {
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();
		
		byte[] data= new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		/* jbbc connection here */
		Connection con=null;
		RequestDispatcher dispatcher=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		 	  con= DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false","root","1234");
		 	  
		 	 PreparedStatement pst=con.prepareStatement("insert into image(imagename) values (?) "); //here table name and column name must be same
		 	 
		 	 pst.setString(1, imageFileName);
		 	 
//moving to jsp page 		 	 
		 	dispatcher=request.getRequestDispatcher("addImage.jsp");
		 	 
//execute the query
int rowcount=pst.executeUpdate();
		 	 if(rowcount>0) {
		 		 System.out.println("image upload successfully ");
		 	 }
		 	 else {
		 		 System.out.println("faskkk");
		 	 }
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  
		
		
	}

}


