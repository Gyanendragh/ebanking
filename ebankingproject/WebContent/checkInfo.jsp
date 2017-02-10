<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Online Banking System</title>
    <link rel="stylesheet" type="text/css" href="css/afterAdminLogin.css"/>
    <link rel="shortcut icon" href="images/pic.jpg"/>
    <style type="text/css">
<!--
.style3 {

	text-decoration: blink;
	font-size: 15px;
	color: #FF0000;
	float:right;
	text-align:center;
}
-->
    </style>
</head>
<body>
	<div id="wrapper">
    	
        <div id="header">
			 <img src="images/logo1.jpg">
			<h1>Online Banking Services </h1><br>
			<h2>Always Connect With Us</h2>
         
        </div>
		<div id="nav">
			<ul>
				<li><a href="afterUserlogin.jsp">Transaction Operation</a>
					<ul>
         				<li><a href="transaction.jsp">view Transaction</a></li>
         				<li><a href="fund_trans_user.jsp">Fund Transfer</a></li>
         			</ul>
         		</li>
				<li><a href="customerinfo.jsp">View Information</a></li>
				<li><a href="balance_enquiry.jsp">Balance Enquiry</a></li>
				<li><a href="chequebook_req.jsp">ChequeBook Request</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			
			<span class="style3">
				
			  <%

            String str = (String) session.getAttribute("username");

            out.print("Welcome " + str);

       		 %>
       		 </span>
		  </ul>
			
		</div>
        <div id="content">
			
			
					 <%
					 
					 String number=request.getParameter("number");
					Connection con = null;
					 try{
						 Class.forName("com.mysql.jdbc.Driver"); 
						 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingproject","root","");
						 Statement statement = con.createStatement();
							ResultSet rs=statement.executeQuery("select * from customer where username= '" + str + "' && password= '" + number + "'");
							if(!rs.next()){
								out.println( "<script>alert('Invalid password check your password!!!')</script>");
								out.println("<script>window.location='customerinfo.jsp'</script>");

							}
							else{
						 
						 
						 
						 
						//Statement statement1 = con.createStatement();
						//ResultSet rss=statement1.executeQuery("select acc_no from customer where username= '" + str + "'");
						
						Statement statement2 = con.createStatement();
						ResultSet rs1=statement2.executeQuery("select * from customer where username= '" + str + "'");
					%>	
					
					
					<h1 align="center">Your Detail Information</h1><br>
					<table align="center" border="1" width="95%">
							
								
									
									<th>CustomerId</th>
									<th>Account maintain At</th>
									<th>Account No</th>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Email</th>
									<th>Gender</th>
									<th>Country</th>
									<th>District/State</th>
									<th>City</th>
									<th>Citizen No</th>
									<th>Account Maintained On</th>
									<th>UserName</th>
									
					
					
					<% 
						while(rs1.next()){ %>
							
								<tr>
									<td><%=rs1.getString(1) %></td>
									<td><%=rs1.getString(2) %></td>
									<td><%=rs1.getString(3) %></td>
									<td><%=rs1.getString(5) %></td>
									<td><%=rs1.getString(6) %></td>
									<td><%=rs1.getString(8) %></td>
									<td><%=rs1.getString(10) %></td>
									<td><%=rs1.getString(11) %></td>
									<td><%=rs1.getString(12) %></td>
									<td><%=rs1.getString(13) %></td>
									<td><%=rs1.getString(14) %></td>
									<td><%=rs1.getString(15) %></td>
									<td><%=rs1.getString(16) %></td>
									
								</tr>
								
							
						<% }
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
					 
				</table>
			
        </div>
        
        <div id="footer">
        <div id="foot">
        		<p>&copy; Copyright 2015,All Rights Reserved </p>
        	</div>
        </div>
    </div>
</body>
</html>
