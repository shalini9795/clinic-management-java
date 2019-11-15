<% 
response.addHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if(session.getAttribute("Patient")==null){
	
	response.sendRedirect("PatientLogin.jsp");
}
%>
<html xmlns="http://www.w3.org/1999/xhtml"
	  xmlns:jsp="http://java.sun.com/JSP/Page"
	  xmlns:c="http://java.sun.com/jsp/jstl/core"/>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="Patient" class="patient.PatientBean" scope="session"/>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="./css/pstylesheet.css">
		<script  type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1 (1).js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/pbehaviour.js"></script>
		<title>PatientAppointments</title>
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
		<center>
		<div>
			<table border="1" cellpadding="5">
			<tr>
				<th>Appointment No.</th>
				<th>Appointment Date</th>
				<th>DoctorName</th>
				<th>Patient ID</th>
				<th>Appointment Time</th>				
				<th>Status</th>
				<th>Purpose</th>
				
			</tr>
			<%
			try {
				
				String i =Patient.getPid();
				System.out.println(i);
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_doc","root","root");
				Statement stmt = con.createStatement();
				String s = "select A_id, appt_date, patient_id, doc_name, appt_time,canceled, purpose from appointment,doctors where appointment.doc_id=doctors.doc_id and patient_id='"+i+"'"; 
				ResultSet rs = stmt.executeQuery(s);
				String status=null;
		while (rs.next() ) {
		%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(5)%></td>
					<% if(rs.getInt(6)==0)
							status="Booked";
							else
							status="Canceled";
						%>
					<td><% out.print(status); %></td>
					<td><%=rs.getString(7)%></td>	
												
				</tr>
				<% } %>
				
					
		<%
		
		rs.close();
		stmt.close();
		con.close();
		} catch (Exception ex) {
			System.out.println(ex);
			ex.printStackTrace();
		}
		%>
		</table>			
		</div>
		</center>
</body>
</html>