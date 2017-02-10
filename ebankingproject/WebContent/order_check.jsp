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

String name6=request.getParameter("number");

String str = (String) session.getAttribute("username");


 %>
 
 
<%
Connection con = null;
 try{
	 Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingproject","root","");
	
	//retrieve acc_no,fname,lname from customer where username=''
			
	Statement statement = con.createStatement();		
	ResultSet rss = statement.executeQuery("select acc_no,fname,lname from customer where username= '" + str + "'");
    
    while( rss.next()){
   String accno=rss.getString("acc_no");
   String fname=rss.getString("fname");
   String lname=rss.getString("lname");
  	//out.print(accno);
    //out.print(fname); 
    // out.print(lname);
   
    
    
	
	PreparedStatement ps=con.prepareStatement("insert into chequeorder(acc_no,fname,lname,date_order,chequebook_no) values('" + accno + "','" + fname + "','" + lname + "',now(),'"+name6+"')");
	
	ps.executeUpdate();
	

	
 }
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
				<li><a href="afterUserLogin.jsp">Previous Page</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>
        <div id="content">
			<h1 align="center">Order for Cheque Book has been Send!!</h1>
        </div>
        
        <div id="footer">
        <div id="foot">
        		<p>&copy; Copyright 2015,All Rights Reserved </p>
        	</div>
        </div>
    </div>
 
</body>
</html>