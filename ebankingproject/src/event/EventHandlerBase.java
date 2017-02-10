/* Event Handler Base
 */

package event;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class EventHandlerBase {

  protected abstract String getURL();
  protected ServletContext sctx;
  
  public void  process(HttpServletRequest request, HttpServletResponse response)throws Exception{
  }
  
  public void forward(HttpServletRequest request, HttpServletResponse response)
             throws IOException, ServletException{

      _dispatch(request, response);
  }
  
  public void _dispatch(HttpServletRequest request, HttpServletResponse response)
             throws IOException, ServletException {
      RequestDispatcher rd = request.getRequestDispatcher(getURL());
      rd.forward(request, response);
  }
}
