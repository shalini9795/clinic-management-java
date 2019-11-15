<% 
response.addHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if(session.getAttribute("Doctor")==null){
	
	response.sendRedirect("DoctorLogin.jsp");
}
%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>  
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 	"http://www.w3.org/TR/html4/loose.dtd">  
 
<html  xmlns="http://www.w3.org/1999/xhtml"
	   xmlns:jsp="http://java.sun.com/JSP/Page"
	   xmlns:c="http://java.sun.com/jsp/jstl/core">
	   
<jsp:useBean id="Doctor" class="doctor.DoctorBean" scope="session"/>
	
	<head>
		<link rel="stylesheet" type="text/css" href="./css/stylesheet.css">
		<script  type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1 (1).js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/behaviour.js"></script>
		<script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
		<title>DoctorHomePage</title>
	</head>
	<body>
	
		<div >
	        	<img src="${pageContext.request.contextPath}/images/image1.jpg" height="300"/>
	    	</div>
		<ul>
		  
		  <li><a href="DoctorHome.jsp">Add Treatment</a></li>
		  <li><a class="active" href="MyAppointments.jsp?id=${Doctor.id}">My Appointments</a></li>
		  <li><a href="PatientHistory.jsp">Patient History</a></li>
		  <li><a href="Feedback.jsp">My Feedback</a></li>
		  <li><a href="MyDetails.jsp">My Details</a></li>
		  <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
		</ul>
		<div id="head_section"  >
			<h1 align="center">Welcome ${Doctor.docname}</h1>
			<button id="treat" type="button">Add Treatment</button>
			<br/>
			<div id="form_section">
			<form action="Prescription" id="treatmentForm"  style= "display:none;" method="post">
			<table  align="center" cellspacing="20">
				<tr>
				<td>Patient Id:-</td>
				<td><input type="text" name="patient_id" onkeyup="searchSuggest(this.value)"/></td>
				</tr>
			
				<tr>				
					<td >
					Name:-</td>
					<td id="auto_name_fetch" ><input id="name" type="text" name="patient_name" disabled="disabled" /></td>
				</tr>
				
				<tr>
					<td>Treatment For:-</td>
					<td><input type="text" name="illness" id="illness"/></td>
				</tr>
				
				<tr>
				<td>Treatment:-</td>
				<td>
				<textarea rows="6" cols="40"  name="treatment_descp" id="treatment_dtls"></textarea>
				</td>
				</tr>
				
				<tr>
				<td>Prescription:-</td>
				<td><textarea rows="6" cols="40" name="prescription" id="prescription"></textarea></td>
				</tr>	
				
				<tr><td colspan="6" align="center">
				<input  id="btn_submit" type="submit" value="Submit"/>
				</td></tr>
				</table>
			</form>
			</div>
	</div>
	</body>
</html>
