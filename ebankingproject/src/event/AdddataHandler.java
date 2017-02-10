package event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

import java.sql.*;
import bean.Login;
import controller.*;
public class AdddataHandler extends EventHandlerBase {
	
	private int loginSuccess = 1;
	private ResultSet  rs;
	
	protected String getURL()
	{
		String url = null;
		if (loginSuccess ==0)
		{
			url = "Loginfailed.html";
		}
		else
			url = "administrator.html";
		return url;
	}
		public void process(HttpServletRequest request,HttpServletResponse response) throws
		ServletException,IOException
		{
			String username=request.getParameter("name");
			String address=request.getParameter("address");
			String phone=request.getParameter("phone");
			String dob=request.getParameter("dob");
			String email=request.getParameter("email");
			
			try{
				
				String query=new String("insert into customer(name,address,email,phone,dob) values('"+username+"', '"+address+"','"+email+"','"+phone+"','"+dob+"')");
				
				if(Controller.con==null){
				Controller.getConnection();
				}
			Statement stmt=Controller.con.createStatement();
			stmt.executeUpdate(query);
			if(rs.next())
			{
				Login lo = getLoginuser();
				HttpSession session=request.getSession();
				session.setAttribute("loginuser", lo);
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
			lo.setUsername(rs.getString("name"));
			lo.setPasssword(rs.getString("password"));
			return lo;
		}
		public void _dispatch(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
			RequestDispatcher rd=request.getRequestDispatcher(getURL());
			rd.forward(request,response);
		}
	}

