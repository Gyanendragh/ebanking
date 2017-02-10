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
String name1=request.getParameter("Branch_addr");
String name2=request.getParameter("Acc_no");
String name3=request.getParameter("Acc_type");
String name4=request.getParameter("First_Name");
String name5=request.getParameter("Last_Name");


String year=request.getParameter("Birthday_Year");
String month=request.getParameter("Birthday_Month");
String day=request.getParameter("Birthday_day");
String ddd=year+"/"+month+"/"+day;

String name7=request.getParameter("email");
String name8=request.getParameter("Mobile_Number");
String name9=request.getParameter("Gender");
String name10=request.getParameter("Country");
String name11=request.getParameter("district");
String name12=request.getParameter("City");
String name13=request.getParameter("citizen_no");
String name14=request.getParameter("username");
String name15=request.getParameter("password");
String name16=request.getParameter("utype");
 
Connection con = null;
 try{
	 Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingproject","root","");
	Statement statement = con.createStatement();
	ResultSet rs=statement.executeQuery("select * from customer where username= '" + name14 + "' or acc_no= '" + name2 + "'");
	
	//Statement statement1 = con.createStatement();
	//ResultSet rs1=statement1.executeQuery("select  from customer");
	
	if(rs.next()){
		out.println( "<script>alert('This username or account no is already exist try another!!!')</script>");
		out.println("<script>window.location='signup.jsp'</script>");

	}
	
		else{
	
	
	PreparedStatement ps=con.prepareStatement("insert into customer(acc_maintain,acc_no,acc_type,fname,lname,dob,email,mobile_no,gender,country,district,city,citizen_no,acc_maintain_on,username,password) values('"+name1+"','"+name2+"','"+name3+"','"+name4+"','"+name5+"','"+ddd+"','"+name7+"','"+name8+"','"+name9+"','"+name10+"','"+name11+"','"+name12+"','"+name13+"',now(),'"+name14+"','"+name15+"')");
	
	PreparedStatement ps1=con.prepareStatement("insert into login(username,password,utype) values('"+name14+"','"+name15+"','"+name16+"')");
	ps1.executeUpdate();
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
				<li><a href="afterAdminLogin.jsp">Previous Page</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>
        <div id="content">
			<h1 align="center">New Account is Created!!</h1>
        </div>
        
        <div id="footer">
        <div id="foot">
        		<p>&copy; Copyright 2015,All Rights Reserved </p>
        	</div>
        </div>
    </div>
 
 
 
 
</body>
</html>