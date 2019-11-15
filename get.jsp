 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
      pageEncoding="ISO-8859-1"%>  
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
 <%@page import="java.sql.*" %>  
 <html>  
   <head>  
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">    
   </head>  
   <body>  
     <%  
       String consultant = request.getParameter("search");    
       String buff1 = "<input type='text' name='patient_name' value=''/>";  
       try {  
         Class.forName("com.mysql.jdbc.Driver");  
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_doc","root","root");  
         Statement stmt = conn.createStatement();  
         ResultSet rs = stmt.executeQuery("Select patient_name from patient where patient_id= '" + consultant + "'");  
         while (rs.next()) {     
           buff1 = "<input type='text' name='patient_name' value='"+rs.getString(1)+"'>";    
         }    
         
         buff1 = buff1 + "</input>";  
         response.getWriter().println(buff1);  
       }catch (Exception e) {  
         System.out.println(e);  
       }  
       
     %>  
   </body>  
 </html>  