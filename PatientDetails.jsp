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
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_doc","root","root");
				Statement stmt = con.createStatement();

				String s = "select patient_name,patient_email,patient_phone,patient_age,patient_gender,patient_address,patient_bloodgrp from patient where patient_id='"+i+"'"; 
				ResultSet rs = stmt.executeQuery(s);

				 
		while (rs.next()) {
			
			%>
						<center>
		<div>
			<table border="1" cellpadding="3" width="50%">
			<tr>
				<td>Name	:</td>
				<td><%=rs.getString(1)%></td>
			</tr>
			<tr>
				<td>Email	:</td>
				<td><%=rs.getString(2)%></td>
			</tr>	
			<tr>	
				<td>Phone	:</td>
				<td><%=rs.getString(3)%></td>
			</tr>

			<tr>	
				<td>Age:</td>
				<td><%=rs.getString(4)%></td>
			</tr>
			<tr>	
				<td>Gender</td>
				<td><%=rs.getString(5)%></td>
			</tr>
			
			<tr>	
				<td>Address		</td>
				<td><%=rs.getString(6)%></td>
			</tr>
			<tr>	
				<td>Bloodgroup</td>
				<td><%=rs.getString(7)%></td>
			</tr>	
		<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>		
</table>
<br><br>  
<center>
<input type="button" onclick="window.location.href='PatientDetailsUpdate.jsp'" value="Edit">
</center>
</body>
</html>
