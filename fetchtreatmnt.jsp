<%@page import="java.sql.*,org.json.*" %>
<%@ page import="java.io.*" %>
					
<%			   
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
try{
				String i = request.getParameter("value");
				System.out.println(i);
				
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_doc","root","root");
				stmt = con.createStatement();

				String s = "select appt_date,illness,treatment_dtls,prescription from treatment where patient_id='"+i+"'"; 
				rs = stmt.executeQuery(s);
				
				if(!rs.next()){
		            out.print("0");
		        }else{
		            JSONArray array=new JSONArray();
		            do{
		                JSONObject obj = new JSONObject();
		                obj.put("Date",rs.getDate("appt_date"));
		                obj.put("Purpose",rs.getString("illness"));
		                obj.put("ApptNotes",rs.getString("treatment_dtls"));		              
		                obj.put("Prescription",rs.getString("prescription"));
		                array.put(obj.toString());
		            }while(rs.next());
		            rs.close();
		            out.print(array);
		        }

}
catch(SQLException e){
	out.print("Exception: "+e);
}
catch(Exception ex){
	System.out.println(ex);
	ex.printStackTrace();
	}
finally{
    if(stmt != null){
        try{
            stmt.close();
        }catch(SQLException e){}
    }
    if(con != null){
        try{
            con.close();
        }catch(SQLException e){}
    }
}
		%>