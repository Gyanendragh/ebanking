<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>Online Banking System</title>
    <link rel="stylesheet" type="text/css" href="css/usertransinfo.css"/>
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
        	<div id="para">
				<p><a href="viewdeposit.jsp">view deposit information</a></p>
				<p><a href="viewtransferBy.jsp">view transfer information on your account</a></p>
				<p><a href="viewtransferTo.jsp">view transfer information from your account</a></p>
			</div>
			
        </div>
        
        <div id="footer">
        <div id="foot">
        		<p>&copy; Copyright 2015,All Rights Reserved </p>
        	</div>
        </div>
    </div>
</body>
</html>