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
String name2=request.getParameter("acc_no_to");
String name3=request.getParameter("dname");
String name4=request.getParameter("remark");
String name5=request.getParameter("amount");
 

Connection con = null;
 try{
	 Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingproject","root","");
	Statement statement = con.createStatement();
	ResultSet rs=statement.executeQuery("select acc_no from customer where acc_no= '" + name1 + "'");
	Statement statement1 = con.createStatement();
	ResultSet rs1=statement1.executeQuery("select acc_no from customer where acc_no= '" + name2 + "'");
	if(!rs.next() || !rs1.next()){
		out.println( "<script>alert('This user account is not exist check your account no!!!')</script>");
		out.println("<script>window.location='fund_trans.jsp'</script>");
		
	
	}
	
	
		
	
	else{
		
			//balance check
			ResultSet rss = statement.executeQuery("select balance from balance_info where acc_no= '" +name1+ "'");
			//ResultSet rsss = statement.executeQuery("select balance from balance_info where acc_no= '" +name2+ "'");
			
			if(!rss.next()){
				out.println( "<script>alert('This user account doesnot have amount to transfer so deposit first!!!')</script>");
				out.println("<script>window.location='fund_trans.jsp'</script>");
				
			}
			
			
			
			
			
			else{
				
				
				ResultSet rsss = statement.executeQuery("select balance from balance_info where acc_no= '" +name2+ "'");
				
				if(!rsss.next()){
					
					ResultSet rsss1 = statement.executeQuery("select fname,lname from customer where acc_no= '" + name2 + "'");
				    
				    while( rsss1.next()){
				  	 String fname=rsss1.getString("fname");
				   	String lname=rsss1.getString("lname");
					
				   	
				    rsss1.close();
					ResultSet rss6 = statement.executeQuery("select balance from balance_info where acc_no= '" +name1+ "'");
			        
				       while( rss6.next()){
				       float amount=rss6.getFloat("balance");
				       float balance = Float.parseFloat(name5);
				       
				       if(amount<=balance){
				    	    out.println( "<script>alert('There is no sufficient amount on your account!!!')</script>");
				   			out.println("<script>window.location='fund_trans.jsp'</script>");
				   			
				   			
				       }
				       
				       else{
				    	   amount-=balance;
				    	   
				    	   PreparedStatement pss=con.prepareStatement("insert into balance_info(acc_no,fname,lname,balance) values('"+name2+"','"+fname+"','"+lname+"','"+name5+"')");
							pss.executeUpdate();
							pss.close();
							
							PreparedStatement ps=con.prepareStatement("insert into fund_transfer(acc_no_from,acc_no_to,transfer_by,remark,date_transfer,amount) values('"+name1+"','"+name2+"','"+name3+"','"+name4+"',now(),'"+name5+"')");
							ps.executeUpdate();
							ps.close();
				    	   
				    	   
				    	   PreparedStatement pss1=con.prepareStatement("update  balance_info set balance='"+amount+"'where acc_no= '" + name1 + "'");
							pss1.executeUpdate();
							pss1.close();
				       }
					
				       }
					rsss.close();
				    }
				    
				}
				
				else{
				
				ResultSet rss5 = statement.executeQuery("select balance from balance_info where acc_no= '" +name1+ "'");
        
			       while( rss5.next()){
			       float amount=rss5.getFloat("balance");
			       float balance = Float.parseFloat(name5);
			       
			       
			       
			       if(amount<=balance){
			    	    out.println( "<script>alert('There is no sufficient amount on your account!!!')</script>");
			   			out.println("<script>window.location='fund_trans.jsp'</script>");
			   			
			   			
			       }
			       
				      		 else{
				      			 
					    	   //decrease balance and update
					    	   amount-=balance;
					    	   //out.print(amount);
					    	   //increase balance and update
					    	   	ResultSet rss1 = statement.executeQuery("select balance from balance_info where acc_no= '" +name2+ "'");
				        
							       while( rss1.next()){
							       float amount1=rss1.getFloat("balance");
							       amount1+=balance;
							       
							     	//out.print(amount1);
							      
							        
							        
						     
							PreparedStatement ps=con.prepareStatement("insert into fund_transfer(acc_no_from,acc_no_to,transfer_by,remark,date_transfer,amount) values('"+name1+"','"+name2+"','"+name3+"','"+name4+"',now(),'"+name5+"')");
							ps.executeUpdate();
							ps.close();
							PreparedStatement ps1=con.prepareStatement("update  balance_info set balance='"+amount+"'where acc_no= '" + name1 + "'");
							ps1.executeUpdate();
							ps1.close();
							PreparedStatement ps2=con.prepareStatement("update  balance_info set balance='"+amount1+"'where acc_no= '" + name2 + "'");
							ps2.executeUpdate();
							ps2.close();
								
				
				
				
						}
				            
	       	  		 }
			       
	      		 }
			       
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
				
					<span class="style4">
				<%

            String str = (String) session.getAttribute("username");

            out.print("Welcome " + str);

       		 %>
				</span>
				
			</ul>
		</div>
        <div id="content">
			<h1 align="center">Your amount has been transfer to the destination account!!</h1>
        </div>
        
        <div id="footer">
        <div id="foot">
        		<p>&copy; Copyright 2015,All Rights Reserved </p>
        	</div>
        </div>
    </div>
 
</body>
</html>