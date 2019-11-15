<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>DocRegisterPage</title>
	<link rel="stylesheet" type="text/css" href="./css/stylesheet.css">
		<script  type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1 (1).js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/behaviour.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
		<script src="js/form-validation.js"></script>

</head>
	<body>
	<center>
	<div >
	        	<img src="${pageContext.request.contextPath}/images/image1.jpg" height="300"/>
	    	</div>
		<form name="Registration" action="Registration" method="POST">
		<div align="left">
			<fieldset>
			<legend>Login info</legend>
			<table  cellpadding = "5"  style="border-collapse=:collapse">
			<tr>
			<td>Name:</td>
			<td><input type="text" name="name" placeholder="Enter your name"/></td>
			</tr>
			<tr>
			<td>Email:</td>
			<td><input type="text" name="email"  placeholder="Enter your email"/></td>
			</tr>
			<tr>
			<td>Password:</td>
			<td><input type="password" name="pwd" id="pwd" placeholder="Enter your password"/></td>
			</tr>
			<tr>
			<td>Confirm Password:</td>
			<td><input type="password" name="cpwd" placeholder="Confirm your password"/></td>
			</tr>
			</table>
			</fieldset>
			<fieldset>
				<legend>Clinic Details:</legend>
			<table cellpadding = "5" cellspacing="1"  style="border-collapse=:collapse">
			<tr>
			<td>Phone No:</td>
			<td><input type="number" name="phno"  placeholder="Enter your phone number"/></td>
			</tr>
			<tr>
			<td>Specialization :</td>
			<td><select name="spl" selected ="Paediatrician">
				    <option>Physician</option>
				    
				    
				    <option>Gynaecologist</option>
				    
				    <option>Nutritionist</option>
				    <option>Counseller</option>
			
				    
					</select></td>
			</tr>
			<tr>
			<td>Fees:</td>
			<td><input type="text" name="fees"  placeholder="Enter your consulting fees"/></td>
			</tr>
			<tr>
			<td>Clinic Address:</td>
			<td><textarea name="address" rows="2" cols="30" placeholder="Enter your clinic address"></textarea></td>
			</tr>
			</table>
			</fieldset>
			
			<fieldset>
			<legend>Personal Information:</legend>
			<table cellpadding = "5" cellspacing="1" style="border-collapse=:collapse">
			<tr>
			<td>Age:</td>
			<td><input type="text" name="age" placeholder="Enter your age"/></td>
			</tr>
			<tr>
			<td>Gender:</td>
			<td><input type="radio" name="gender"  value="M" /> Male
				  	<input type="radio" name="gender"  value="F"/> Female
				 	 <input type="radio" name="gender" value="O"/> Other</td>
			</tr>
			</table>
		</fieldset>
		</div>
		<br/><br/>
				    <input type="submit" value="Submit" align="center"/>
		</form>
		</center>
	</body>
</html>