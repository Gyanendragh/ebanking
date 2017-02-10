<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>Online Banking System</title>
    <link rel="stylesheet" type="text/css" href="css/deposit.css"/>
    <link rel="shortcut icon" href="images/pic.jpg"/>

	<script type="text/javascript" src="javascript/validation.js" >
    
	</script>
	
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
        	<form action="deposit_amount.jsp" method="post" onsubmit="return check()">
            <fieldset>
                <legend>Amount Deposit Form</legend>
                	<table  align="center" cellpadding = "10" height="700px" width="70%">
                			<tr>
                			<td> Account Number</td>
                			<td><input type="text" class="textfield" value="" id="extra7" name="acc_no" onkeypress="return isNumber(event)" placeholder="enter acc no"  required="required"/></td>
                			</tr>
                			
                			<tr>
                			<td>Deposit By</td>
                			<td><input type="text" name="dname" placeholder="enter your name" pattern="[a-zA-Z]{3,}" title="Minimum 3 letters " required="required" maxlength="30"/></td>
                			</tr>
                			
                			<tr>
                			<td>Remark</td>
                			<td><textarea name="remark" rows="2" cols="30" pattern="[a-zA-Z]{10,}" title="Minimum 10 letters " placeholder="enter your remark" required="required"></textarea></td>
                			</tr>
                			
                			
                			<tr>
                			<td>Deposit Amount</td>
                			<td><input type="text" name="amount" placeholder="enter the total amount" class="textfield" value="" id="extra7" onkeypress="return isNumber(event)" required="required" maxlength="7"/></td>
                			</tr>
                			
                			<tr>
							<td colspan="2" align="center">
							<input type="submit" value="Deposit">
							<input type="reset" value="Reset">
							</td>
							</tr>
                	</table>  
                
            </fieldset>    
        </form>
        </div>
        
        <div id="footer">
        <div id="foot">
        		<p>&copy; Copyright 2015,All Rights Reserved </p>
        	</div>
        </div>
    </div>
</body>
</html>
