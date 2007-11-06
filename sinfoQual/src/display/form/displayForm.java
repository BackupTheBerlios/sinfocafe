package display.form;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;


public class displayForm extends org.apache.struts.action.ActionForm {
    
    private String id;
    private String product;
    private String producerName;
    private String interestGroup;
    private String organization;
    private String typeCoffee;
    private String batch;
    private String beginDate;
    private String endDate;
    private ArrayList tab = new ArrayList();
    private ArrayList result = new ArrayList();
    private String results = null;
    private String typeOne = null;
    private String typeTwo = null;

    
    public String getTypeOne() {return typeOne;}
    public void setTypeOne(String var) {typeOne=var;}
    
    public String getTypeTwo() {return typeTwo;}
    public void setTypeTwo(String var) {typeTwo=var;}
    
    public String getResults() {return results;}
    public void setResults(String string) {results = string;}
    
    public String getBeginDate() {return beginDate;}
    public void setBeginDate(String string) {beginDate = string;}
    
    public String getEndDate() {return endDate;}
    public void setEndDate(String string) {endDate = string;}
    
    public String getId() {return id;}
    public void setId(String string) {id = string;}
    
    public String getProduct() {return product;}
    public void setProduct(String string) {product = string;}
    
    public String getProducerName() {return producerName;}
    public void setProducerName(String string) {producerName = string;}
    
    public String getInterestGroup() {return interestGroup;}
    public void setInterestGroup(String string) {interestGroup = string;}
    
    public String getOrganization() {return organization;}
    public void setOrganization(String string) {organization = string;}
    
    public String getTypeCoffee() {return typeCoffee;}
    public void setTypeCoffee(String string) {typeCoffee = string;}
    
    public String getBatch() {return batch;}
    public void setBatch(String string) {batch = string;}

    public ArrayList getTab () {return tab;}
    public void setTab (ArrayList array) {tab = array;}
    
    public ArrayList getResult () {return result;}
    public void setResult (ArrayList array) {result = array;}
    
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        return errors;
    }
}
