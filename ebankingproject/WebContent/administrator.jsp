<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="login" class="bean.Login" scope="session"></jsp:useBean>

<%@ page language="java" import="java.sql.*, javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,javax.servlet.http.HttpSession" %> <b><center>     

        <%

            String name = request.getParameter("name");

            String pass = request.getParameter("password");

            try {

            	Class.forName("com.mysql.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingproject?autoReconnect=true", "root", "");

                Statement st = con.createStatement();

                ResultSet rs = st.executeQuery("select * from login");
                
               
                

                int x = 0;

                while (rs.next()) {

                    if ((rs.getString("username").equals(name)) && rs.getString("password").equals(pass)) {

                        String stp = rs.getString("utype");

                        if (stp.equals("admin")) {

                            x = 1;

                            break;

                        } else {

                            x = 2;

                            break;

                        }

                    }

                }

                if (x == 2) {

                    response.sendRedirect("afterUserLogin.jsp");

                } else if (x == 1) {

                    response.sendRedirect("afterAdminLogin.jsp");

                } else {

                	
                	 %>
                	 
                 <h3><font color=red>Either you enter Invalid UserName or Password! Please Try Again</font></h3>

       

        <jsp:include page="login.html" />

        <%}

 

            } catch (Exception e) {

                out.println(e);

            }
			
            
            
           
           session.setAttribute("username", name);
          

        %> 

</body>
</html>