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
										<center>
		<div>
			<table border="1" cellpadding="3" width="50%">
			<tr>
				<th>Sr. No</th>
				<th>Feedback</th>
			</tr>
			
				<%
			try {
				
				int sr=1;
				String i =Doctor.getId();
				//String i ="D105";
				System.out.println(i);
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_doc","root","root");
				Statement stmt = con.createStatement();

				String s = "select feedback from feedback where doc_id='"+i+"'"; 
				ResultSet rs = stmt.executeQuery(s);

				 
		while (rs.next()) {
			
			%>
			
			<tr align="center">
				<td><%= sr++ %></td>
				<td><%=rs.getString(1)%></td>
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
</body>
</html>