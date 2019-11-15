<% 
response.addHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if(session.getAttribute("Doctor")==null){
	
	response.sendRedirect("DoctorLogin.jsp");
}
%>
<html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="Doctor" class="doctor.DoctorBean" scope="session"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="./css/stylesheet.css">
				<script  type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1 (1).js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/behaviour.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
		<script src="js/form-validation.js"></script>
<title>Insert title here</title>
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
		</div>
		
		<h1>Welcome ${Doctor.id}</h1>
		
		<%
			try {
				
				String i =Doctor.getId();
				System.out.println(i);
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_doc","root","root");
				Statement stmt = con.createStatement();
				//String s = "select * from Doctors where doc_id='D105'";
				String s = "select * from Doctors where doc_id='"+i+"'"; 
				ResultSet rs = stmt.executeQuery(s);
				String status=null;
				 
		while (rs.next()) {
			
			%>

		
		<form	method="post" action="MyDetailsUpdateProcess.jsp"	>
		<fieldset>
			    
				    <div>
				    Name:<br/>
				    <input type="text" name="name" value="<%=rs.getString("doc_name") %>" />
				    </div>
				    
				    
				    <div>
				    Email:<br/>
				    <input type="email" name="email" value="<%=rs.getString("doc_email") %>" />
				    </div>
				    
				    			    
				    <div>
				    Phone:<br/>
				    <input type="number" name="phno" value="<%=rs.getString("doc_phone") %>" />
				    </div>
				    
				     <div>
				    Specialization :<br/>
				    <select name="specialization" selected ="<%=rs.getString("doc_specialition") %>">
				    <option>Physician</option>
				    <option>Gynaecologist</option>
				    <option>Nutritionist</option>
				    <option>Counseller</option>
					</select>
				    </div>
				    				    			    
				    <div>
				    Fees:<br/>
				    <input type="number" name="fees" value="<%=rs.getString("doc_fees") %>" />
				    </div>
				    
				    
				    <div>
				    Clinic Address:<br/>
				    <input type="text" name="address" value="<%=rs.getString("doc_address") %>" />
				    </div>
				    
				    				    			    
				    <div>
				    Age:<br/>
				    <input type="number" name="age" value="<%=rs.getString("doc_age") %>" />
				    </div>
				    
				   <div>
				    Gender: 
 					<select name="gender" selected="<%=rs.getString("doc_gender") %>">
				    <option value="M">Male</option>
				    <option value="F">Female</option>
				    <option value="O">Other</option>
				    </select>
				    </div>
			<br><br>
<input type="submit" value="submit">
<button type="button" onclick="window.location.href='MyDetails.jsp'">Cancel</button>
</fieldset>
</form>	    
				 
	<%
}
stmt.close();
rs.close();
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>	   



	</body>
</html>