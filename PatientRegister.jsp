<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
		<script  type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1 (1).js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/behaviour.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
		<script src="js/form-validation.js"></script>
</head>
<body>

	    <div >
	        <img src="./images/image2.jpg" height="300">
	        <script src="http://code.jquery.com/jquery-latest.js"></script>
	    </div>
	
<center>
<form action="pRegistration" method="POST">
  <fieldset>
    <legend>Contact Details:</legend>
    <div>
    Name:<br/>
    <input type="text" name="name" />
    </div>
    
    
    <div>
    Email:<br/>
    <input type="email" name="email" />
    </div>
    
    
    <div>
    Password:<br/>
    <input type="password" name="pwd" />
    </div>
    
    
    <div>
    Confirm Password:<br/>
    <input type="password" name="cpwd" />
    </div>
    
    
    <div>
    Phone No:<br/>
    <input type="text" name="phno"/>
    </div>
    
    
    <div>
    Address:<br/>
    <textarea name="address" rows="2" cols="30">
	</textarea>
	</div>
	 </fieldset>
	 <br/>
	 
	 <fieldset>
	  <legend>Personal Information:</legend>
	<div>
    Age:<br/>
    <input type="text" name="age" />
    </div>
    
    
    <div>
    Gender: 
    <input type="radio" name="gender"  value="M" /> Male
  	<input type="radio" name="gender"  value="F"/> Female
 	 <input type="radio" name="gender" value="O"/> Other
    </div><br/>
    
    <div>
    Blood Group:
    <select name="bgrp" selected ="O Positive">
    <option>A Positive</option>
    <option>A Negative</option>
    <option>B Positive</option>
    <option>B Negative</option>
    <option>AB Positive</option>
    <option>AB Negative</option>
    <option>O Positive</option>
    <option>O Negative</option>
    <option>Unknown</option>
</select>
    </div>
    <br/><br/>
    <input type="submit" value="Submit"/>
  </fieldset>
  
</form>
</center>
</body>
</html>