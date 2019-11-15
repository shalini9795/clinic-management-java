<% 
response.addHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if(session.getAttribute("Patient")==null){
	
	response.sendRedirect("PatientLogin.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:useBean id="Patient" class="patient.PatientBean" scope="session"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/pstylesheet.css">
<title>Give Feedback</title>

<style>
input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>


</head>
<body>
 <div >
	        <img src="./images/image2.jpg" height="300">
	  
	    </div>
<ul>
	  <li><a href="appointment.jsp">Book Appointment</a></li>
	  <li><a class="active" href="PatientDetails.jsp">My Details</a></li>
	  <li><a href="PatientAppt.jsp">View Bookings</a></li>
	  <li><a href="CancelAppointment.jsp">Cancel Appointment</a></li>
	  <li><a href="FeedbackPatient.jsp">Feedback</a></li>
	  <li><a href="${pageContext.request.contextPath}/plogout">Logout</a></li>
	</ul>

<h3>Feedback Form</h3>

<div class="container">
  <form action="FeedbackServlet" method="post">
    <label for="name">Your Name</label>
    <input type="text" id="name" name="name" placeholder="Your name..">

    

    <label for="docname">Doctor Name</label>
    <select id="docname" name="docname">
      <%
 			Class.forName("com.mysql.jdbc.Driver").newInstance();  
 			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_doc","root","root");  
			Statement stmt = con.createStatement();  
 			ResultSet rs = stmt.executeQuery("Select doc_id,doc_name from doctors");
 			while(rs.next()){
	 %>
	 
      <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>  
      <%
 			}
 	
     %>
    </select>

    <label for="feedback">Feedback</label>
    <textarea id="feedback" name="feedback" placeholder="Write something.." style="height:200px"></textarea>

    <input type="submit" value="Submit">
  </form>
</div>
<a href="DoctorHome.jsp">Back</a>

</body>
</html>