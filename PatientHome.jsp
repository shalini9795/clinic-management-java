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

<jsp:useBean id="Patient" class="patient.PatientBean" scope="session"/>
	<head>
		<link rel="stylesheet" type="text/css" href="./css/pstylesheet.css">
		<script  type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1 (1).js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/behaviour.js"></script>
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
</body>
</html>
