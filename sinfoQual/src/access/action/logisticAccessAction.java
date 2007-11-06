/*
 * logisticAccessAction.java
 *
 * Created on 27 mai 2007, 21:16
 */

package access.action;

import access.form.accessForm;
import generate.access;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.write.WriteException;
import mail.action.mailAction;

import org.apache.struts.actions.LookupDispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import java.util.*;

/**
 *
 * @author bastien
 * @version
 */

public class logisticAccessAction extends LookupDispatchAction {
    
    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    
    /** Provides the mapping from resource key to method name.
     * @return Resource key / method name map.
     */
    protected Map getKeyMethodMap() {
        Map map = new HashMap();
        map.put("button.generate", "generate");
        map.put("button.mailTheResults", "mail");
        map.put("button.print", "print");
        return map;
    }
    
    /** Action called on Add button click
     */
    public ActionForward generate(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws java.lang.Exception {
        accessForm formulaire = (accessForm) request.getSession().getAttribute("onglet");
        try {
            new access(formulaire);
        } catch (WriteException e) {
            System.out.println(e);
        }
        
        return mapping.findForward(SUCCESS);
    }
    
    /** Action called on Edit button click
     */
    public ActionForward mail(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws java.lang.Exception {
        try {
            new mailAction();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return mapping.findForward(SUCCESS);
    }
    
    /** Action called on Delete button click
     */
    public ActionForward print(ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws java.lang.Exception {
        // TODO:implement delete method
        return mapping.findForward(SUCCESS);
    }
}
