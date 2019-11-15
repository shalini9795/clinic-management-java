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
				

				String name=request.getParameter("name");
				String email=request.getParameter("email");
				String phno=request.getParameter("phno");
				String specialization=request.getParameter("specialization");
				String fees=request.getParameter("fees");
				String address=request.getParameter("address");
				String age=request.getParameter("age");
				String gender=request.getParameter("gender");
				
				System.out.println(specialization);
				
				System.out.println(address);
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_doc","root","root");
				con.setAutoCommit(false);
				try{

				 
				String sql1 = "update doctors set doc_name=?,doc_email=?,doc_phone=?,doc_specialition=?,doc_fees=?,doc_address=?,doc_age=?,doc_gender=? where doc_id='"+i+"'";
				
				PreparedStatement ps = con.prepareStatement(sql1);

				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, phno);
				ps.setString(4, specialization);
				ps.setString(5, fees);
				ps.setString(6, address);
				ps.setString(7, age);
				ps.setString(8, gender);
				
				
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
