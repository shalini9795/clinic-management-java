<%@page import="java.sql.*"%>



<%
//String ida = request.getParameter("id").toString();
String state=request.getParameter("count").toString(); 
String docname="";
int count=0;
String date1="02/01/2018";
String date2="02/02/2018";
String date3="02/03/2018";
String date4="02/04/2018";
String date5="02/05/2018";

 String buffer1="<select name='slots'><option value='-1'>Select</option>";  
String docid="0";
if(state.equals(date1)||state.equals(date2)||state.equals(date3)||state.equals(date4)||state.equals(date5))
	docid="D101";
else
	docid="0";

 try{
	 
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_doc","root","root");  
 Statement stmt = con.createStatement();
 Statement stmt1 = con.createStatement();
 ResultSet rs1 = stmt.executeQuery("select count(slot_time) from doctor_appointments where `status`='0' and slot_date like'"+state+"'");
 while(rs1.next()){
	 System.out.println("hello");
 }
 ResultSet rs = stmt.executeQuery("select slot_time from doctor_appointments where `status`='"+1+"'"+ "and slot_date like'"+state+"'"+"and doc_id='D101'");  
   while(rs.next()){
	   System.out.println("hello");
   buffer1=buffer1+"<option value='"+rs.getTime(1)+"'>"+rs.getTime(1)+"</option>";  
   }  
 buffer1=buffer1+"</select>";  
 
 response.getWriter().println(buffer1); 
 //System.out.println(ida);
	 
 }
 catch(Exception e){
     System.out.println(e);
 }
 %>