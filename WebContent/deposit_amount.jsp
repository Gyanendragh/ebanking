<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Banking System</title>
    <link rel="stylesheet" type="text/css" href="css/afterAdminLogin.css"/>
    <link rel="shortcut icon" href="images/pic.jpg"/>
      <style type="text/css">
<!--
.style4 {
	text-decoration: blink;
	font-size: 15px;
	text-align:center;
	color: #FF0000;
}
-->
    </style>
<title>Insert title here</title>
</head>
<body>
 <%
String name1=request.getParameter("acc_no");
String name4=request.getParameter("dname");
String name5=request.getParameter("remark");
String name7=request.getParameter("amount");
 

Connection con = null;
 try{
	 Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingproject","root","");
	Statement statement = con.createStatement();
	ResultSet rs=statement.executeQuery("select acc_no from customer where acc_no= '" + name1 + "'");
	if(!rs.next()){
		out.println( "<script>alert('This user account is not exist!!!')</script>");
		out.println("<script>window.location='deposit.jsp'</script>");

		rs.close();
	}
	
	
	else{
		
		
		
	
		ResultSet rss = statement.executeQuery("select balance from balance_info where acc_no= '" +name1+ "'");
		
				if(!rss.next()){
					
					ResultSet rsss = statement.executeQuery("select fname,lname from customer where acc_no= '" + name1 + "'");
				    
				    while( rsss.next()){
				   String fname=rsss.getString("fname");
				   String lname=rsss.getString("lname");
					
					
					PreparedStatement pss=con.prepareStatement("insert into balance_info(acc_no,fname,lname,balance) values('"+name1+"','"+fname+"','"+lname+"','"+name7+"')");
					pss.executeUpdate();
					pss.close();
					
		  			PreparedStatement pss1=con.prepareStatement("insert into deposit_info(acc_no,depositBy,date,remark,amount) values('"+name1+"','"+name4+"',now(),'"+name5+"','"+name7+"')");
					pss1.executeUpdate();
					pss1.close();
				    }
				    rsss.close();
		  		 }
		
		else{
			
			ResultSet rss5 = statement.executeQuery("select balance from balance_info where acc_no= '" +name1+ "'");
        
        while( rss5.next()){
       float amount=rss5.getFloat("balance");
       //out.print(amount);
       
      		 
       
        float balance = Float.parseFloat(name7);
		amount+=balance;
		//out.print(balance);
		
        
			PreparedStatement ps=con.prepareStatement("insert into deposit_info(acc_no,depositBy,date,remark,amount) values('"+name1+"','"+name4+"',now(),'"+name5+"','"+name7+"')");
			ps.executeUpdate();
			ps.close();
			PreparedStatement ps1=con.prepareStatement("update balance_info set balance='"+amount+"' where acc_no='" +name1+ "'");
			ps1.executeUpdate();
			ps1.close();
			
			
        }
        
		}
        
      
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
			<h1 align="center">Your amount has been deposited!!</h1>
        </div>
        
        <div id="footer">
        <div id="foot">
        		<p>&copy; Copyright 2015,All Rights Reserved </p>
        	</div>
        </div>
    </div>
 
</body>
</html>