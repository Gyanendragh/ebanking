/* Common Exception
 */
package exceptions;

public class CommonException extends ExceptionHandlerBase{
  private String retryURL;
  private String messages;

  public CommonException(String msg,String retryURL){
    super(msg);
    this.retryURL=retryURL;
    this.messages=msg;
  }

  public String getRetryURL(){
     return retryURL;
  }

  public String getErrorMessage() {
     return this.messages;
  }
}
