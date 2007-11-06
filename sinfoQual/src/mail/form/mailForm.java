/*
 * mailForm.java
 *
 * Created on 29 mai 2007, 17:28
 */

package mail.form;

/**
 *
 * @author bastien
 * @version
 */

public class mailForm extends org.apache.struts.action.ActionForm {
    
    private String from = null;
    private String to = null;
    private String cc = null;
    private String cci = null;
    private String object = null;
    private String file = null;
    private String corps = null;
    private String smtp = null;
    private String path = null;
    
    
    public String getPath() {return path;}
    public void setPath(String var) {path = var;}
    
    public String getFrom() {return from;}
    public void setFrom(String var) {from = var;}
    
    public String getTo() {return to;}
    public void setTo(String var) {to=var;}
    
    public String getCc() {return cc;}
    public void setCc(String var) {cc=var;}
    
    public String getCci() {return cci;}
    public void setCci(String var) {cci=var;}
    
    public String getObject() {return object;}
    public void setObject(String var) {object=var;}
    
    public String getFile() {return file;}
    public void setFile(String var) {file=var;}
    
    public String getCorps() {return corps;}
    public void setCorps(String var) {corps=var;}
    
    public String getSmtp() {return smtp;}
    public void setSmtp(String var) {smtp=var;}
}
