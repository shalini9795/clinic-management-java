<% 
response.addHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if(session.getAttribute("Patient")==null){
	
	response.sendRedirect("PatientLogin.jsp");
}
%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>  
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 	"http://www.w3.org/TR/html4/loose.dtd">  

<html  xmlns="http://www.w3.org/1999/xhtml"
	   xmlns:jsp="http://java.sun.com/JSP/Page"
	   xmlns:c="http://java.sun.com/jsp/jstl/core">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="Patient" class="patient.PatientBean" scope="session"/>
	<head>
		<link rel="stylesheet" type="text/css" href="./css/pstylesheet.css">
		<script  type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1 (1).js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/pbehaviour.js"></script>
		<title>PatientHomePage</title>
	</head>
	<body>
	
	
	    <div >
	        <img src="./images/image2.jpg" height="300">
	        <script src="http://code.jquery.com/jquery-latest.js"></script>
	    </div>
	
	<ul>
	  <li><a href="appointment.jsp">Book Appointment</a></li>
	  <li><a class="active" href="PatientDetails.jsp">My Details</a></li>
	  <li><a href="PatientAppt.jsp">View Bookings</a></li>
	  <li><a href="CancelAppointment.jsp">Cancel Appointment</a></li>
	  <li><a href="FeedbackPatient.jsp">Feedback</a></li>
	 <li><a href="${pageContext.request.contextPath}/plogout">Logout</a></li>
	</ul>
	<div>
		<h1 align="center">Welcome ${Patient.pname}</h1>
	</div>
	<%
			try {
				
				String i =Patient.getPid();
				System.out.println(i);
				
				String name=request.getParameter("name");
				String email=request.getParameter("email");
				String phno=request.getParameter("phno");
				String age=request.getParameter("age");
				String gender=request.getParameter("gender");
				String address=request.getParameter("address");
				String bgrp=request.getParameter("bgrp");
		
				
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_doc","root","root");
				con.setAutoCommit(false);
				try{
				String sql1 = "update patient set patient_name=?,patient_email=?,patient_phone=?,patient_age=?,patient_gender=?,patient_address=?,patient_bloodgrp=?  where patient_id='"+i+"'";
					
				PreparedStatement ps = con.prepareStatement(sql1);

				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, phno);
				ps.setString(4, age);
				ps.setString(5, gender);
				ps.setString(6, address);
				ps.setString(7, bgrp);

				int c =ps.executeUpdate();
				con.commit();
				if(c > 0)
				{
				out.print("Record Updated Successfully");
				
				}
				else
				{
					
				out.print("There is a problem in updating Record.");

				} 
				}
				catch (Exception e) {
				    System.out.print(e);
		            try {
		            	out.print("Rolling back");
						con.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						throw new RuntimeException(e);
					}
		            throw new RuntimeException(e);
		        }
		
			
			}
catch (Exception e) {}
				
			
			%>
						
</body>
</html>
