<% 
response.addHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if(session.getAttribute("Patient")==null){
	
	response.sendRedirect("PatientLogin.jsp");
}%>
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
<form	method="post" action="PatientDetailsUpdateProcess.jsp"	>
		<fieldset>
			    
				    <div>
				    Name:<br/>
				    <input type="text" name="name" value="<%=rs.getString("patient_name") %>" />
				    </div>
				    
				    
				    <div>
				    Email:<br/>
				    <input type="email" name="email" value="<%=rs.getString("patient_email") %>" />
				    </div>
				    
				    			    
				    <div>
				    Phone:<br/>
				    <input type="number" name="phno" value="<%=rs.getString("patient_phone") %>" />
				    </div>
				    
				    <div>
				    Age:<br/>
				    <input type="number" name="age" value="<%=rs.getString("patient_age") %>" />
				    </div>
				    
				    				   <div>
				    Gender: 
 					<select name="gender" selected="<%=rs.getString("patient_gender") %>">
				    <option value="M">Male</option>
				    <option value="F">Female</option>
				    <option value="O">Other</option>
				    </select>
				    </div>
				    
				    <div>
				    Address:<br/>
				    <input type="text" name="address" value="<%=rs.getString("patient_address") %>" />
				    </div>
				    
				    <div>
				    Blood Group:<br/>
				       <select name="bgrp" selected ="<%=rs.getString("patient_bloodgrp") %>">
    <option>A Positive</option>
    <option>A Negative</option>
    <option>B Positive</option>
    <option>B Negative</option>
    <option>AB Positive</option>
    <option>AB Negative</option>
    <option>O Positive</option>
    <option>O Negative</option>
    <option>Unknown</option>
</select>
				   
				    </div>
				    
				    <br><br>
<input type="submit" value="submit">
<button type="button" onclick="window.location.href='PatientMyDetails.jsp'">Cancel</button>
				    
				    </fieldset>
				    </form>
		<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>		
   
</body>
</html>
