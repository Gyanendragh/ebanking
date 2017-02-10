package controller;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import event.*;
import event.ErrorEventHandler;
import exceptions.*;
import java.util.ArrayList;
import java.util.Enumeration;
import java.sql.*;


public class Controller extends HttpServlet {
 
		public static	 Connection con = null; 
 
  private ServletContext sctx;
  private HashMap eventmapping = new HashMap();
  
  public void init() throws ServletException {
 
    try {
       Enumeration e = getServletConfig().getInitParameterNames();  
       while ( e.hasMoreElements()){
            String anEvent = ( String ) e.nextElement();
	  		eventmapping.put(anEvent,getServletConfig().getInitParameter(anEvent));
		}	
    }
    catch (Exception e) {
      e.printStackTrace();
    }    
  } 
 
 
  /** Handles the HTTP <code>GET</code> method.
   * @param request servlet request
   * @param response servlet response
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
      ServletException, IOException {
    processRequest(request, response);
  }

  /** Handles the HTTP <code>POST</code> method.
   * @param request servlet request
   * @param response servlet response
   */
  protected void doPost(HttpServletRequest request,HttpServletResponse response) throws 
  	  ServletException,IOException {                        	
    processRequest(request, response);
  } 
  
  protected void processRequest(HttpServletRequest request,HttpServletResponse response) throws
      ServletException, IOException {     	     	 	

    String event = validateEvent(request);
    EventHandlerBase handler = getEventHandler(event);
    
    try {
       handler.process(request, response);
    }
    catch (CommonException e) {
      request.setAttribute("ERROR", e.getMessage());
      System.out.println("error: " + e.getMessage());
      request.setAttribute("retryURL", e.getRetryURL());
    }
    catch (Exception e) {
      request.setAttribute("ERROR", e.getMessage());
      System.out.println("error: " + e.getMessage());
     }
    
    handler.forward(request, response);
  }

  
  protected String validateEvent(HttpServletRequest request) {
    String e = request.getParameter("event");
    if (e == null || !this.eventmapping.containsKey(e)) {
        e = "errorevent";
    }
    return e;
  }

 
  /*
    This method determines the event handler class from the event
   */
  protected EventHandlerBase getEventHandler(String eventName) {
    
    EventHandlerBase event =null;
   
    try {
      String value = (String) eventmapping.get(eventName);
      System.out.println(value);
      try {
        event = (EventHandlerBase) Class.forName(value).newInstance();
      }
      catch (Throwable t) {
        event = (EventHandlerBase) Class.forName("ErrorEventHandler").newInstance();
      }
    }
    catch (Exception ioe) {
      ioe.printStackTrace();
    }
    return event;
  }
  
  
  public static void getConnection(){
		
		
		try{

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/bankingproject?autoReconnect=true", "root", ""); 
		}
		catch(ClassNotFoundException cnfe){
			System.err.println("Error loading driver:" +cnfe);
		}
		catch(SQLException sqle){
			System.err.println("Error connecting:" +sqle);
		}
	}
  
  
}

