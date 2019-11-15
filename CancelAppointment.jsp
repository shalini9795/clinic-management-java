<% 
response.addHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if(session.getAttribute("Patient")==null){
	
	response.sendRedirect("PatientLogin.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<html  xmlns="http://www.w3.org/1999/xhtml"
	   xmlns:jsp="http://java.sun.com/JSP/Page"
	   xmlns:c="http://java.sun.com/jsp/jstl/core">

<jsp:useBean id="Patient" class="patient.PatientBean" scope="session"/>
	<head>
		<link rel="stylesheet" type="text/css" href="./css/pstylesheet.css">
		<script  type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1 (1).js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/pbehaviour.js"></script>
		<title>PatientHomePage</title>
		
		 <link rel="stylesheet" type="text/css" href="./css/pstylesheet.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<style>
    	fieldset {
      		border: 0;
      		align:center;
    	}
    	
    	label {
      		display: block;
      		margin: 30px 0 0 0;
    	}
    	.overflow {
      		height: 200px;
    	}
    	.c
    	{
    		align:center;
    	}
	</style>
  	<script>
  		$(function() {
  	    $( "#datepicker" ).datepicker({ minDate: 0});
  	  });
  	</script>
  	<script language="javascript" type="text/javascript">  
		var xmlHttp  
		var xmlHttp
      
      function showDoctor(str){
			if (typeof XMLHttpRequest != "undefined"){
      			xmlHttp= new XMLHttpRequest();
      		}
			else if (window.ActiveXObject){
				xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
			}
			if (xmlHttp==null){
				alert("Browser does not support XMLHTTP Request")
				return;
			} 
      var url="doctor.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = CategoryChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function CategoryChange(){   
      	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      		document.getElementById("doctors").innerHTML=xmlHttp.responseText   
      	}   
      }
      
      function showSlots(str){
          if (typeof XMLHttpRequest != "undefined"){
            xmlHttp= new XMLHttpRequest();
            }
          else if (window.ActiveXObject){
            xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
            }
          if (xmlHttp==null){
          alert("Browser does not support XMLHTTP Request")
          return;
          } 
          var url="slot1.jsp";
          url +="?count="+str;
          xmlHttp.onreadystatechange = dateChange;
          xmlHttp.open("GET", url, true);
          xmlHttp.send(null);
         }     
          function dateChange(){   
          if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("slots").innerHTML=xmlHttp.responseText   
          }   
          }
      </script>  
  </head>
		
		
	</head>
	<body>
	
	<%
	String id = Patient.getPid();
	String name = Patient.getPname(); %>
	
	    <div >
	        <img src="./images/image2.jpg" height="300">
	  
	    </div>
	
	<ul>
	  <li><a href="appointment.jsp">Book Appointment</a></li>
	  <li><a class="active" href="PatientDetails.jsp">My Details</a></li>
	  <li><a href="PatientAppt.jsp">View Bookings</a></li>
	  <li><a href="FeedbackPatient.jsp">Feedback</a></li>
	<li><a href="${pageContext.request.contextPath}/plogout">Logout</a></li>
	</ul>
	<div>
		<h1 align="center">Welcome ${Patient.pname}</h1>
	</div>
	
	
	<body>
	<h2>Cancel Your Appointment</h2>
	<div style="background-color: #e0f5ff">
	 <br/>
	 <form action="CancelServlet" method="post" target="_self" >
	<fieldset>
	 <table  cellpadding="5" cellspacing="2"  align="center"  bgcolor="#ceefff">
	 <tr>
	 <th>Patient Id </th>
	 <td><input type="text" name="pid" id="pid" value="<%=id %>"/></td>
	 </tr>
	 
	 <tr>
	 <th>Patient Name</th>
	 <td> <input type="text" id="pname"  value="<%=name %>" /> </td>
	 <td></td>
	 
	 <tr>
	 <th>Category:&nbsp;&nbsp;</th>
	 <td> <select name="category" onchange="showDoctor(this.value)">
	    <option value="none">Select</option>
	      <%
	 			Class.forName("com.mysql.jdbc.Driver").newInstance();  
	 			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_doc","root","root");  
				Statement stmt = con.createStatement();  
	 			ResultSet rs = stmt.executeQuery("Select distinct doc_specialition from doctors");
	 			while(rs.next()){
		 %>
	      <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>  
	      <%
	 			}
	     %>
	    </select></td>
	 </tr>
	 
	 
	 <tr>
	    <th>Doctor:&nbsp;&nbsp;&nbsp;&nbsp;</th>
	      <td id='doctors' >
	 			<select name="doctors" id="doctors">
	           	<option value='-1'></option>  
	      		</select>
	         </td>
	   </tr>
	   
	   <tr>
	 	<th>Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
	    <td><input type="text"  name="datepicker" id="datepicker" onchange="showSlots(this.value)"></td>
	    </tr>
	    
	    <tr>
		<th>Choose Time:</th>
	
		<td id='slots' >
	 			<select name="slots" id="slots">
	           	<option value='-1'></option>  
	      		</select>
	         </td>
		</tr>
		
		<tr>
		<td><br/> </td>
		<td><input type="submit" name="submit" Value="Submit"></td>
		</tr>
		
	</table>
	</fieldset>
	</form>
	</body>

</html>