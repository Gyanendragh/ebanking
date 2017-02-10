<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

			<%
			Connection con = null;
			
			String id=request.getParameter("id");
			
			try{
			
				 Class.forName("com.mysql.jdbc.Driver"); 
				 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingproject","root","");
				 Statement statement = con.createStatement();
				 
				 PreparedStatement ps = con.prepareStatement("delete  from customer where customer_id= "+id);
			     ps.executeUpdate();
			     ps.close();
			     response.sendRedirect("alluser.jsp");
			     }  
			 catch(SQLException sqle)
			 {
			 	out.print(sqle.getMessage());
			 	
			 }
			 finally{
				 try{
					 if(con!=null){
						 con.close();
					 }
				 }
				 catch(SQLException sqle)
				 {
					 out.print(sqle.getMessage());
				 }
			 }
		%>

</body>
</html>