<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Online Banking System</title>
	<link rel="stylesheet" type="text/css" href="css/style_signup.css"/>
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
    
    <script type="text/javascript" src="javascript/validation.js" >
    
	</script>
	



    
	<style type="text/css">
		h3{font-family: Calibri; font-size: 22pt; font-style: normal; font-weight: bold;  margin-top: 10px; color:#66CCCC;
		text-align: center; text-decoration: none }
		table{font-family: Calibri; color:#66CCCC; font-size: 15pt; font-style: normal;  margin-top: 10px; text-align:; background-color: gray; 						         border-collapse: collapse}
		table.inner{border: 0px}
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
        
        	 <%
 			
 			String id=request.getParameter("id");
 			String fname="";
 			String lname="";
 			String email="";
 			String mobile_no="";
 			String country="";
 			String district="";
 			String city="";
 			String citizion_no="";
 			String username="";
 			
 			Connection con = null;
			 try{
				 Class.forName("com.mysql.jdbc.Driver"); 
				 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingproject","root","");
				Statement statement = con.createStatement();
				ResultSet rs=statement.executeQuery("select * from customer where customer_id="+id);
				while(rs.next()){
					fname=rs.getString("fname");
				   	lname=rs.getString("lname");
				   	email=rs.getString("email");
				   	mobile_no=rs.getString("mobile_no");
				   	country=rs.getString("country");
				   	district=rs.getString("district");
				   	city=rs.getString("city");
				   	citizion_no=rs.getString("citizen_no");
				   	username=rs.getString("username");
					
				}
				
				rs.close();
			
				
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
        
        
        
        
        
        
        
        
        
			<h3>CUSTOMER REGISTRATION FORM</h3>
						<form action="updatevalue.jsp" name="form" method="get" onsubmit="return check()">
						 
						<table align="center" cellpadding = "10" height="750px" width="70%">
					
						<!----- First Name ---------------------------------------------------------->
						<tr>
						<td>FIRST NAME</td>
						<td><input type="text" name="First_Name" value="<%=fname %>" id="First_Name" placeholder="enter firstname" pattern="[a-zA-Z]{3,}" title="Minimum 3 letters only" required="required" maxlength="30"/>
						(max 30 characters a-z and A-Z)
						</td>
						</tr>
						 
						<!----- Last Name ---------------------------------------------------------->
						<tr>
						<td>LAST NAME</td>
						<td><input type="text" name="Last_Name"  value="<%=lname %>" id="Last_Name" placeholder="enter lastname" pattern="[a-zA-Z]{3,}" title="Minimum 3 letters " required="required" maxlength="30"/>
						(max 30 characters a-z and A-Z)
						</td>
						</tr>
						 
						
						<!----- Email Id ---------------------------------------------------------->
						<tr>
						<td>EMAIL ID</td>
						<td><input name="email" type="text" class="inputs" id="email_address" value="<%=email %>" size="35" maxlength="255" placeholder="enter your valid email"/>
						
						</td>
						</tr>
						 
						<!----- Mobile Number ---------------------------------------------------------->
						<tr>
						<td>MOBILE NUMBER</td>
						<td>
						<input type="text" name="Mobile_Number" id="Mobile_Number"  value="<%=mobile_no %>" placeholder="enter mobile no"  required="required" maxlength="10" />
						(10 digit number)
						</td>
						</tr>
						 
						
						
						
						<!----- Country ---------------------------------------------------------->
						<tr>
						<td>COUNTRY</td>
						<td><input type="text" name="Country"  value="<%=country %>" id="Country" pattern="[a-zA-Z]{3,}" title="Minimum 3 letters " placeholder="enter country" required="required" /></td>
						</tr>
						
						<!----- District ---------------------------------------------------------->
						<tr>
						<td>District</td>
						<td><input type="text" name="district"  value="<%=district %>" id="district" maxlength="30" pattern="[a-zA-Z]{3,}" title="Minimum 3 letters " placeholder="enter district/state" required="required" />
						(max 30 characters a-z and A-Z)
						</td>
						</tr>
						 
						<!----- City ---------------------------------------------------------->
						<tr>
						<td>CITY</td>
						<td><input type="text" name="City" id="City"  value="<%=city%>" maxlength="30"  pattern="[a-z A-Z]{3,}" title="Minimum 3 letters"  placeholder="enter city" required="required" />
						(max 30 characters a-z and A-Z)
						</td>
						</tr>
						
						
						 
						<!----- Citizen no---------------------------------------------------------->
						<tr>
						<td>CITIZEN NO</td>
						<td><input type="text" class="textfield" value="<%=citizion_no%>" id="extra7" name="citizen_no" onkeypress="return isNumber(event)" placeholder="enter citizen no"   required="required"/>
						
						
						</td>
						</tr>
						
						<!----- Username---------------------------------------------------------->
						<tr>
						<td>USERNAME</td>
						<td><input type="text" name="username" id="username"  value="<%=username %>" maxlength="20" placeholder="enter username" pattern="[a-zA-Z0-9]{5,}" title="Minimum 5 letters" required="required" />
						
						(max 15 characters Alphanumeric)
						
						<tr>
						<td colspan="2"><input type="hidden" name="id" value="<%=id %>"></td>
						</tr>
						 
					
						 
						<!----- Submit and Reset ------------------------------------------------->
						<tr>
						<td colspan="2" align="center">
						<input type="submit" value="submit">
						<input type="reset" value="Reset">
						</td>
						</tr>
						</table>
						 
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
