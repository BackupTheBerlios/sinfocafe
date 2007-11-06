/*
 * accessAction.java
 *
 * Created on 7 avril 2007, 13:12
 */

package access.action;

import access.bean.accessBean;
import access.form.accessForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
/**
 *
 * @author alex
 * @version
 */

public class accessAction extends Action {    
    
    public ActionForward execute(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        if (form!=null)
        {
            accessForm accessFormulaire = (accessForm)form;
            accessBean bean = new accessBean();
            BeanUtils.copyProperties(bean, accessFormulaire);
        }
        
        return mapping.findForward("ok");        
    }
}
