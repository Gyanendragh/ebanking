/* Exception Handler Base
 */
 
package exceptions;

import javax.servlet.jsp.JspException;

public abstract class ExceptionHandlerBase extends JspException {
    
    public abstract String getErrorMessage();
    
    protected String getRetryURL(){return "";}
    
    /** Creates a new instance of ExceptionHandlerBase */
    public ExceptionHandlerBase(String msg) {
        super(msg);
    }
}
