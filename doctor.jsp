<%@page import="java.sql.*"%>
<%

String category=request.getParameter("count");
 String buffer="<select name='doctors'><option value='-1'>Select</option>";  
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_doc","root","root");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select doc_id,doc_name from doctors where doc_specialition='"+category+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>";    
   }  
 buffer=buffer+"</select>"; 

 System.out.println(buffer);
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>