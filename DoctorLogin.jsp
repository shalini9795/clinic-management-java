<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>Doctor Login</title>
		<link rel="stylesheet" href="doc.css"/>
		<link rel="stylesheet" type="text/css" href="./css/pstylesheet.css">
	</head>
	<body>
		<div>
		    <div >
		        <img src="${pageContext.request.contextPath}/images/doc_login1.jpg" height="300" width="100%"/>
		        <script src="http://code.jquery.com/jquery-latest.js"></script>
		    </div>
		    <ul>
	  <li><a href="index.html">Home</a></li>
	  </ul>
		<div align="center">
			<h1>Welcome</h1>
			<form method="POST" action="login">
				<p>
					<b>Doctor ID: </b><br/>
					<input type="text" name="DoctorId"/>
				</p>
				<p>
					<b>Password</b><br/>
					<input type="password" name="Password"/>
				</p>
				<p>
					<input type="submit" value="Login"/>
				</p>
			</form>
			<a href="DoctorRegister.jsp">Register</a>
			<p>
				<b>${param.failed ? "Invalid Customer ID or Password" : "Authentication Required"}</b>
			</p>
		</div>
		</div>
	</body>
	</html>