<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
	
	<script type="text/javascript">
			function checkEmail(inputvalue){	
			    var pattern=/^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;
			    if(pattern.test(inputvalue)){         
					alert("correct email");   
			    }else{   
					alert("invalid email"); 
			    }
			
			
			}
			
			
		
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
			<h3>CUSTOMER REGISTRATION FORM</h3>
						<form action="checkSignup.jsp" name="form" method="POST" onsubmit="return check()">
						 
						<table align="center" cellpadding = "10" height="750px" width="70%">
						
						<!----- Account maintain at ---------------------------------------------------------->
						<tr>
						<td>MAINTAINED AT</td>
						<td><input type="text" name="Branch_addr" id="Branch_addr" pattern="[a-zA-Z]{3,}" title="Minimum 3 letters " placeholder="enter address" required="required" maxlength="30"/>
						(Branch of bank)
						</td>
						</tr>
						
						<!----- Account no ---------------------------------------------------------->
						<tr>
						<td>ACCOUNT NO</td>
						<td><input type="text" name="Acc_no" id="Acc_no" placeholder="enter account no" required="required" maxlength="30"/>
						(max 30 characters a-z and A-Z)
						</td>
						</tr>
						
							
						<script type="text/javascript">	
							var stampmonths = new Array( "01","02","03","04","05","06","07","08","09","10","11","12");
							var thedate = new Date();
							var code =(stampmonths[ thedate.getMonth()] + thedate.getDate() + thedate.getFullYear() + thedate.getSeconds() );
							window.onload = function() {
							document.getElementById('content').style.display;
							document.getElementById('Acc_no').value = code ;
				
							//alert(code);
				
							}
			
						</script>
						<!----- Account type ---------------------------------------------------------->
						<tr>
						<td>ACCOUNT TYPES</td>
						<td>
						<select size="multiple" name="Acc_type">
						<option value="saving">Saving</option>
						<option value="operative_call">Operative Call</option>
						<option value="current">Current</option>
						<option value="others">Others</option>
						</select>
						</td>
						</tr>
						 
						<!----- First Name ---------------------------------------------------------->
						<tr>
						<td>FIRST NAME</td>
						<td><input type="text" name="First_Name" id="First_Name" placeholder="enter firstname" pattern="[a-zA-Z]{3,}" title="Minimum 3 letters only" required="required" maxlength="30"/>
						(max 30 characters a-z and A-Z)
						</td>
						</tr>
						 
						<!----- Last Name ---------------------------------------------------------->
						<tr>
						<td>LAST NAME</td>
						<td><input type="text" name="Last_Name" id="Last_Name" placeholder="enter lastname" pattern="[a-zA-Z]{3,}" title="Minimum 3 letters " required="required" maxlength="30"/>
						(max 30 characters a-z and A-Z)
						</td>
						</tr>
						 
						<!----- Date Of Birth -------------------------------------------------------->
						<tr>
						<td>DATE OF BIRTH</td>
						 
						<td>
						<select name="Birthday_Year" id="Birthday_Year">
						 
						<option value="-1">Year:</option>
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
						<option value="2009">2009</option>
						<option value="2008">2008</option>
						<option value="2007">2007</option>
						<option value="2006">2006</option>
						<option value="2005">2005</option>
						<option value="2004">2004</option>
						<option value="2003">2003</option>
						<option value="2002">2002</option>
						<option value="2001">2001</option>
						<option value="2000">2000</option>
						 
						<option value="1999">1999</option>
						<option value="1998">1998</option>
						<option value="1997">1997</option>
						<option value="1996">1996</option>
						<option value="1995">1995</option>
						<option value="1994">1994</option>
						<option value="1993">1993</option>
						<option value="1992">1992</option>
						<option value="1991">1991</option>
						<option value="1990">1990</option>
						 
						<option value="1989">1989</option>
						<option value="1988">1988</option>
						<option value="1987">1987</option>
						<option value="1986">1986</option>
						<option value="1985">1985</option>
						<option value="1984">1984</option>
						<option value="1983">1983</option>
						<option value="1982">1982</option>
						<option value="1981">1981</option>
						<option value="1980">1980</option>
						</select>
						 
						<select id="Birthday_Month" name="Birthday_Month">
						<option value="-1">Month:</option>
						<option value="01">Jan</option>
						<option value="02">Feb</option>
						<option value="03">Mar</option>
						<option value="04">Apr</option>
						<option value="05">May</option>
						<option value="06">Jun</option>
						<option value="07">Jul</option>
						<option value="08">Aug</option>
						<option value="09">Sep</option>
						<option value="10">Oct</option>
						<option value="11">Nov</option>
						<option value="12">Dec</option>
						</select>
						
						<select name="Birthday_day" id="Birthday_Day">
						<option value="-1">Day:</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						 
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						 
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						 
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						 
						<option value="31">31</option>
						</select>
						</td>
						</tr>
						 
						<!----- Email Id ---------------------------------------------------------->
						<tr>
						<td>EMAIL ID</td>
						<td><input name="email" type="text" class="inputs" id="email_address" value="any@any.com" size="35" maxlength="255">
						<input name="summit" type="submit" value="Check" onClick="checkEmail(document.form.email.value)">
						
						</td>
						</tr>
						 
						<!----- Mobile Number ---------------------------------------------------------->
						<tr>
						<td>MOBILE NUMBER</td>
						<td>
						<input type="text" name="Mobile_Number" id="Mobile_Number" placeholder="enter mobile no"  required="required" maxlength="10" />
						(10 digit number)
						</td>
						</tr>
						 
						<!----- Gender ----------------------------------------------------------->
						<tr>
						<td>GENDER</td>
						<td>
						Male <input type="radio" name="Gender" value="Male" />
						Female <input type="radio" name="Gender" value="Female" />
						</td>
						</tr>
						 
					
						<!-- <tr>
						<td>ADDRESS <br /><br /><br /></td>
						<td><textarea name="Address" rows="4" cols="30" placeholder="enter address" required="required"></textarea></td>
						</tr>
						 -->
						
						<!----- Country ---------------------------------------------------------->
						<tr>
						<td>COUNTRY</td>
						<td><input type="text" name="Country" id="Country" pattern="[a-zA-Z]{3,}" title="Minimum 3 letters " placeholder="enter country" required="required" /></td>
						</tr>
						
						<!----- District ---------------------------------------------------------->
						<tr>
						<td>District</td>
						<td><input type="text" name="district" id="district" maxlength="30" pattern="[a-zA-Z]{3,}" title="Minimum 3 letters " placeholder="enter district/state" required="required" />
						(max 30 characters a-z and A-Z)
						</td>
						</tr>
						 
						<!----- City ---------------------------------------------------------->
						<tr>
						<td>CITY</td>
						<td><input type="text" name="City" id="City" maxlength="30"  pattern="[a-z A-Z]{3,}" title="Minimum 3 letters"  placeholder="enter city" required="required" />
						(max 30 characters a-z and A-Z)
						</td>
						</tr>
						
						
						 
						<!----- Citizen no---------------------------------------------------------->
						<tr>
						<td>CITIZEN NO</td>
						<td><input type="text" class="textfield" value="" id="extra7" name="citizen_no" onkeypress="return isNumber(event)" placeholder="enter citizen no"   required="required"/>
						
						
						</td>
						</tr>
						
						<!----- Username---------------------------------------------------------->
						<tr>
						<td>USERNAME</td>
						<td><input type="text" name="username" id="username" maxlength="20" placeholder="enter username" pattern="[a-zA-Z0-9]{5,}" title="Minimum 5 letters" required="required" />
						
						(max 15 characters Alphanumeric)
						</td>
						</tr>
						
						<!----- password---------------------------------------------------------->
						<tr>
						<td>PASSWORD</td>
						<td><input type="password" name="password" id="password" maxlength="10"  pattern="[a-zA-Z0-9]{6,}" title="Minimum 6 letters without space" placeholder="enter password" required="required" />
						(max 10 characters Alphanumeric)
						</td>
						</tr>
						
						<!----- usertype---------------------------------------------------------->
						<tr>
						<td>USERTYPE</td>
						<td><input type="text" name="utype" id="utype" maxlength="20" pattern="[a-zA-Z]{6,}" title="Minimum 6 letters without space" placeholder="ente user type" required="required" />
						
						</td>
						</tr>
						 
					
						 
						<!----- Submit and Reset ------------------------------------------------->
						<tr>
						<td colspan="2" align="center">
						<input type="submit" value="Submit">
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
