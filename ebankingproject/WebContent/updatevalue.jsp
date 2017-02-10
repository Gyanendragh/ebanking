<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Banking System</title>
    <link rel="stylesheet" type="text/css" href="css/afterAdminLogin.css"/>
    <link rel="shortcut icon" href="images/pic.jpg"/>
<title>Insert title here</title>
</head>
<body>
 <%
String id=request.getParameter("id");
String name1=request.getParameter("First_Name");
String name2=request.getParameter("Last_Name");
String name3=request.getParameter("email");
String name4=request.getParameter("Mobile_Number");
String name5=request.getParameter("Country");
String name6=request.getParameter("district");
String name7=request.getParameter("City");
String name8=request.getParameter("citizen_no");
String name9=request.getParameter("username");

 //out.print(id);
Connection con = null;
 try{
	 Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingproject","root","");
	
	Statement statement = con.createStatement();

	PreparedStatement ps=con.prepareStatement("update customer set fname='"+name1+"',lname='"+name2+"',email='"+name3+"',mobile_no='"+name4+"',country='"+name5+"',district='"+name6+"',city='"+name7+"',citizen_no='"+name8+"',username='"+name9+"' where customer_id="+id);
	ps.executeUpdate();
	ps.close();
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
 
 
 
 <div id="wrapper">
    	
        <div id="header">
			 <img src="images/logo1.jpg">
			<h1>Online Banking Services </h1><br>
			<h2>Always Connect With Us</h2>
         
        </div>
		<div id="nav">
			<ul>
				<li><a href="afterAdminLogin.jsp">Previous Page</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>
        <div id="content">
			<h1 align="center">Update Successfully!!</h1>
        </div>
        
        <div id="footer">
        <div id="foot">
        		<p>&copy; Copyright 2015,All Rights Reserved </p>
        	</div>
        </div>
    </div>
 
 
 
 
</body>
</html>