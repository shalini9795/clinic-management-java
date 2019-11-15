<% 
response.addHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if(session.getAttribute("Doctor")==null){
	
	response.sendRedirect("DoctorLogin.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:useBean id="Doctor" class="doctor.DoctorBean" scope="session"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PatientHistory</title>
	<link rel="stylesheet" type="text/css" href="./css/pstylesheet.css">
		<script  type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1 (1).js">	
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/behaviour.js"></script>
</head>
<body>
<div>
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
	<div id="nameBox">
				<h1 align="center">Welcome ${Doctor.docname}</h1>
	<table align="center">
		<tr>
			<td>Patient ID</td><td><input type="text" name="pid" id="pid" onkeyup="searchSuggest(this.value)"/></td>
		</tr>
		<tr>
			<td>Patient Name</td>
			<td id="auto_name_fetch" ><input id="name" type="text" name="patient_name" disabled="disabled" /></td>
		</tr>
		
		<tr>
		<td><br/> </td>
		<td><button  id="getPatientDtls" onclick="fetch();fetch1();" type="button" style="text-align: center;">Show details</button></td>
		</tr>
	</table>
	</div>
	
		<table id="patientdtls" align="center" border="1px" cellpadding="3" width="50%" style="display: none;">
		<tr>
			<th>Age</th>
			<th>Gender</th>
			<th>BloodGroup</th>
		</tr>
		<tbody id="content">
		
		</tbody>
			
		</table>
		<br/>
		<br/>
		<br/>
		<table id="apptdtls" align="center" border="1px" cellpadding="3" width="50%" style="display: none;">
		<tr>
			<th>Date</th>
			<th>Purpose</th>
			<th>Appointment Notes</th>
			<th>Prescription</th>
		</tr>
		<tbody id="content2">
		
		</tbody>
		</table>
	

	</div>
</body>
</html>