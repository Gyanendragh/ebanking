package event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

import java.sql.*;
import bean.Login;
import controller.*;
public class LoginEventHandler extends EventHandlerBase {
	
	private int loginSuccess = 1;
	private ResultSet  rs;
	
	protected String getURL()
	{
		String url = null;
		if (loginSuccess ==0)
		{
			url = "loginfailed.jsp";
		}
		else
			url = "administrator.jsp";
		return url;
	}
		public void process(HttpServletRequest request,HttpServletResponse response) throws
		ServletException,IOException
		{
			String username=request.getParameter("name");
			String password=request.getParameter("password");
			
			try{
				
				String query=new String("select * from login where username='"+username+"' and password='"+password+"'");
				if(Controller.con==null){
				Controller.getConnection();
				}
			Statement stmt=Controller.con.createStatement();
			rs=stmt.executeQuery(query);
			if(rs.next())
			{
				Login lo = getLoginuser();
				HttpSession session=request.getSession();
				session.setAttribute("loginuser", lo);
				session.setAttribute("user",username);
				System.out.println("Data Stored In Session");
			}
			else
			{
				loginSuccess=0;
			}
			rs.close();
		}
		catch (Exception e)
		{
			request.setAttribute("ERROR", e.getMessage());
			System.out.print("error:" + e.getMessage());
		}
	}
		public Login getLoginuser() throws SQLException
		{
			Login lo=new Login();
			lo.setUsername(rs.getString("username"));
			lo.setPasssword(rs.getString("password"));
			return lo;
		}
		public void _dispatch(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
			RequestDispatcher rd=request.getRequestDispatcher(getURL());
			rd.forward(request,response);
		}
	}

