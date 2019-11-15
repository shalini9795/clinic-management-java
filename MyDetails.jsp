<% 
response.addHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if(session.getAttribute("Doctor")==null){
	
	response.sendRedirect("DoctorLogin.jsp");
}
%>
<html xmlns="http://www.w3.org/1999/xhtml"
	  xmlns:jsp="http://java.sun.com/JSP/Page"
	  xmlns:c="http://java.sun.com/jsp/jstl/core"/>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="Doctor" class="doctor.DoctorBean" scope="session"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="./css/stylesheet.css">
		<script  type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1 (1).js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/behaviour.js"></script>
<title>Insert title here</title>
</head>
<body>
		
		<div>
		    <div >
	        	<img src="${pageContext.request.contextPath}/images/image1.jpg" height="300"/>
		        <script src="http://code.jquery.com/jquery-latest.js"></script>
		    </div>
		
		<ul>
		  
		  <li><a href="DoctorHome.jsp">Add Treatment</a></li>
		  <li><a class="active" href="MyAppointments.jsp?id=${Doctor.id}">My Appointments</a></li>
		  <li><a href="PatientHistory.jsp">Patient History</a></li>
		  <li><a href="Feedback.jsp">My Feedback</a></li>
		  <li><a href="MyDetails.jsp">My Details</a></li>
		  <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
		</ul>
		</div>
		
		<h1>Welcome ${Doctor.id}</h1>
		
		<%
			try {
				
				String i =Doctor.getId();
				System.out.println(i);
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_doc","root","root");
				Statement stmt = con.createStatement();

				String s = "select doc_name,doc_email,doc_phone,doc_specialition,doc_fees,doc_address,doc_age,doc_gender from Doctors where doc_id='"+i+"'"; 
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
				<td>Specilization:</td>
				<td><%=rs.getString(4)%></td>
			</tr>
			<tr>	
				<td>Fees		</td>
				<td><%=rs.getString(5)%></td>
			</tr>
			
			<tr>	
				<td>Address		</td>
				<td><%=rs.getString(6)%></td>
			</tr>
			<tr>	
				<td>Age		</td>
				<td><%=rs.getString(7)%></td>
			</tr>	
			
			<tr>
				<td>Gender</td>
				<td><%=rs.getString(8)%></td>
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
<input type="button" onclick="window.location.href='DetailsUpdate.jsp'" value="Edit">
</center>	

</body>
</html>