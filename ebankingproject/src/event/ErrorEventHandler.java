package event;

import java.io.IOException;
import javax.servlet.ServletException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.*;
import javax.servlet.http.*;
import exceptions.*;

public class ErrorEventHandler extends EventHandlerBase {

	protected String getURL() {  	
  	  	//retrieve URL with the help of Hash Map		
		//String url = (String) events.get(URL);
		String url="/WEB-INF/jsppages/erroroccured.jsp";
    	return url;
	}
	
	public void process(HttpServletRequest request, HttpServletResponse response) throws
    	ServletException, IOException {         	
  }  
  
	public void _dispatch(HttpServletRequest request,HttpServletResponse response) throws 
		ServletException, IOException {
      	
    	RequestDispatcher rd = request.getRequestDispatcher(getURL()); 
	 	rd.forward(request,response); 
	}	
}

