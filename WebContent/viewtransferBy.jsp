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
					 
					 
					Connection con = null;
					 try{
						 Class.forName("com.mysql.jdbc.Driver"); 
						 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingproject","root","");
						 Statement statement = con.createStatement();
						
						ResultSet rss = statement.executeQuery("select acc_no from customer where username= '" + str + "'");
						
			             if( rss.next()){
			            String accno=rss.getString("acc_no");
			            //out.print(accno);
			            
			             
						ResultSet rs1=statement.executeQuery("select * from fund_transfer where acc_no_to= '"+accno+ "' ");
						
						%>	
					
					
					<h1 align="center">View transfer information on your account no</h1><br>
					<table align="center" border="1" width="75%">
							
								
									
									<th>Transfer Date</th>
									<th>Amount</th>
									<th>Transfer By</th>
									<th>Remark</th>
									
									
					
					
					<% 
						while(rs1.next()){ %>
							
								<tr>
									<td><%=rs1.getString(5) %></td>
									<td><%=rs1.getString(6) %></td>
									<td><%=rs1.getString(3) %></td>
									<td><%=rs1.getString(4) %></td>
									
									
								</tr>
								 
							
						<% }
				
							rs1.close();
			             }
			           rss.close();
			             
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
