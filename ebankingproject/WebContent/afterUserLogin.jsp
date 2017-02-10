
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
        	<div id="pic">
        		<div id="a1">
        			<img src="images/bank.jpg">
        		</div>
        		<div id="a2">
	        		<p align="justify">
	        		<h2 style="font-family:comic sans; color:white;font-size:18px; align:justify;">
	        			&nbsp;&nbsp;Banks are the institutions that must promote trust and reliability with an 
						open and friendly interface for their clients. In the online world,&nbsp;&nbsp; an internet 
						banking service must have a strong presence and their interface must promote 
						safety and friendly services.Online banking (OLB) is an electronic payment system that enables customers of a financial 
						institution to conduct financial transactions on a website operated by the institution, 
						such as a retail bank, virtual bank, credit union or building society. Online banking 
						is also referred </br> as Internet banking, e-banking, virtual banking and by other terms.
						</h2>
	        		</p>
        		</div>
        	</div>
        	<div id="pic1">
        		<div id="pic2">
        			<div id="head">
        				<img src="images/contact.png">
        				<h1>Contact Us</h1>
        			</div>
        			<div id="para">
        				<p align="justify"> 
        				Online Bank Limited</br>
        				Kathmandu,Nepal</br>
        				Tel: 5532246,5532247</br>
        			 	Email: onlinebank@gmail.com</br>
        			 	&nbsp; &nbsp;&nbsp; &nbsp;
        			 	
        		   		<h2 style="font-family:comic sans; color:white;font-size:18px;">&nbsp; What used to be a lunchtime errand is now an anytime convenience.</br>
						&nbsp; &nbsp;E-banking gives you unique views into your personal finances without  </br>
						&nbsp; &nbsp;having to leave the house.Enjoy the convenience of banking anywhere,</br>
						 &nbsp; &nbsp;anytime on your schedule with the OLB service.</h2>
						<a href="https://www.facebook.com/"><img src="images/facebook.png" ></a>
						</p>
        		   </div>
        			
        		</div>
        		<div id="pic3">
        			<img src="images/image.jpg" ">
        		</div>
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
