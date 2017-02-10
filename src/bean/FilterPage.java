package bean;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class FilterPage
 */
@WebFilter("*.jsp")
public class FilterPage implements Filter {

    /**
     * Default constructor. 
     */
    public FilterPage() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		HttpServletRequest httpReq=(HttpServletRequest)request;
		String pageUrl=httpReq.getRequestURI();
		System.out.println(pageUrl);
		if(!(pageUrl.indexOf("login.html")>=1 || pageUrl.indexOf("administrator.jsp")>=1  )){     //&& pageUrl.indexOf("FilterPage")<=-1)
			HttpSession session=httpReq.getSession();
			String userName=(String)session.getAttribute("username");
			if(userName!=null){
				chain.doFilter(request, response);
			}else{
				HttpServletResponse res=(HttpServletResponse)response;
				
				res.sendRedirect("login.html");
			}
		}else{
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
