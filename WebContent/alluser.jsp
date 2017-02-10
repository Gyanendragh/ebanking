<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Banking System</title>
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
				<li><a href="signup.jsp">Create New Account</a></li>
			
         		<li><a href="afterAdminLogin.jsp">Transaction Operations</a>
         		
         			<ul>
         				<li><a href="deposit.jsp">Deposit Amount</a></li>
         				<li><a href="fund_trans.jsp">Fund Transfer</a></li>
         			</ul>
         		</li>
          							
				<li><a href="alluser.jsp">Customers</a></li>
				<li><a href="chequebook_admincheck.jsp">ChequeBook Request</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			    
				<span class="style4">
				<%

            String str = (String) session.getAttribute("username");

            out.print("Welcome " + str);

       		 %>
				</span>
			</ul>
			
	  </div>
      <div id="content">
        
        	
					
					
					 <%
					 
					Connection con = null;
					 try{
						 Class.forName("com.mysql.jdbc.Driver"); 
						 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingproject","root","");
						Statement statement = con.createStatement();
						ResultSet rs=statement.executeQuery("select * from customer");
					%>	
					
					
					<h1 align="center">Detail information of customers</h1><br>
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
									<th>Action</th>
									
									
								
					
					
					<% 
						while(rs.next()){ %>
							
								
								<tr>
									<td><%=rs.getString(1) %></td>
									<td><%=rs.getString(2) %></td>
									<td><%=rs.getString(3) %></td>
									<td><%=rs.getString(5) %></td>
									<td><%=rs.getString(6) %></td>
									<td><%=rs.getString(8) %></td>
									<td><%=rs.getString(10) %></td>
									<td><%=rs.getString(11) %></td>
									<td><%=rs.getString(12) %></td>
									<td><%=rs.getString(13) %></td>
									<td><%=rs.getString(14) %></td>
									<td><%=rs.getString(15) %></td>
									<td><%=rs.getString(16) %></td>
									<td><a href="deleteinfo.jsp?id=<%=rs.getString(1) %>">Delete</a>&nbsp;/&nbsp;<a href="updateinfo.jsp?id=<%=rs.getString(1) %>">Update</a></td>
									
								</tr>
							
							
						<% }
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