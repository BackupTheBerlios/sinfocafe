/*
 * ongletAction.java
 *
 * Created on 7 avril 2007, 15:52
 */

package access.action;

import access.bean.accessBean;
import access.form.accessForm;
import generate.access;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.write.WriteException;
import org.apache.commons.beanutils.BeanUtils;

import org.apache.struts.actions.LookupDispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import java.util.*;
import hibernate.*;
import java.sql.Date;

/**
 *
 * @author alex
 * @version
 */

public class ongletAction extends LookupDispatchAction {
    
    /* forward name="path" path="" */
    private String path="failure";
    
    /** Provides the mapping from resource key to method name.
     * @return Resource key / method name map.
     */
    protected Map getKeyMethodMap() {
        Map map = new HashMap();
        map.put("tab.greenCoffee", "greenCoffee");
        map.put("tab.size", "size");
        map.put("tab.flaw", "flaw");
        map.put("tab.tasting", "tasting");
        map.put("tab.testResult", "testResult");
        map.put("button.saveTheResults", "save");
        return map;
    }
    
    public ActionForward greenCoffee(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws java.lang.Exception {
        path="greenCoffee";
        
        accessForm accessFormulaire = (accessForm)form;
        accessBean bean = new accessBean();
        BeanUtils.copyProperties(bean, accessFormulaire);
        
        System.out.println("-----------------");
        System.out.println("green " + bean.getGreenCoffee());
        System.out.println("flaw " + bean.getFlaw());
        System.out.println("size " + bean.getSize());
        System.out.println("tasting " + bean.getTasting());
        System.out.println("-----------------");
        
        return mapping.findForward(path);
    }
    
    public ActionForward size(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws java.lang.Exception {
        path="size";
        
        accessForm accessFormulaire = (accessForm)form;
        accessBean bean = new accessBean();
        BeanUtils.copyProperties(bean, accessFormulaire);
        
        System.out.println("-----------------");
        System.out.println("green " + bean.getGreenCoffee());
        System.out.println("flaw " + bean.getFlaw());
        System.out.println("size " + bean.getSize());
        System.out.println("tasting " + bean.getTasting());
        System.out.println("-----------------");
        
        return mapping.findForward(path);
    }
    
    public ActionForward flaw(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws java.lang.Exception {
        path="flaw";
        
        accessForm accessFormulaire = (accessForm)form;
        accessBean bean = new accessBean();
        BeanUtils.copyProperties(bean, accessFormulaire);
        
        return mapping.findForward(path);
    }
    
    public ActionForward tasting(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws java.lang.Exception {
        path="tasting";
        
        accessForm accessFormulaire = (accessForm)form;
        accessBean bean = new accessBean();
        BeanUtils.copyProperties(bean, accessFormulaire);
        
        return mapping.findForward(path);
    }
    
    public ActionForward testResult(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws java.lang.Exception {
        path="testResult";
        
        accessForm accessFormulaire = (accessForm)form;
        accessBean bean = new accessBean();
        BeanUtils.copyProperties(bean, accessFormulaire);
        
        return mapping.findForward(path);
    }
    
    public ActionForward save(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws java.lang.Exception {
        path="save";
        
        accessForm accessFormulaire = (accessForm)form;
        accessBean bean = new accessBean();
        BeanUtils.copyProperties(bean, accessFormulaire);
        
        if (bean.getTwelve() != null) bean.setFirstTest("true");
        if (bean.getPerfum() != null) bean.setSecondTest("true");
                
        java.util.Date date = new java.util.Date();
        java.sql.Date dateSQL = new java.sql.Date(date.getTime());
        
        StringTokenizer str = new StringTokenizer(bean.getDate(), " ");
        String day = str.nextToken();
        String month = str.nextToken();
        String year = str.nextToken();
        String tmp = year.concat("-").concat(month).concat("-").concat(day);
        dateSQL = Date.valueOf(tmp);
        ResultsFacade face = new ResultsFacade();
        face.generate(dateSQL, bean.getProducerName(), bean.getInterestGroup(), bean.getOrganization(), bean.getTypeCoffee(), bean.getBatch(), bean.getPerfum(), bean.getFlavor(), bean.getBody(), bean.getAcidity(), bean.getResidue(), bean.getPerfumAdd(), bean.getFlavorAdd(), bean.getBodyAdd(), bean.getAcidityAdd(), bean.getResidueAdd(), bean.getTwelve(), bean.getThirteen(), bean.getFourteen(), bean.getFifteen(), bean.getSixteen(), bean.getSeventeen(), bean.getEighteen(), bean.getNineteen(), bean.getTwenty(), bean.getTwentyOne(), bean.getHumidity(), bean.getColor(), bean.getSmell(), bean.getUniformity(), bean.getDenseness(), bean.getComment(), bean.getPartiallyDamaged(), bean.getPartiallyBlack(), bean.getCutIntoABatch(), bean.getCutIntoALittle(), bean.getGreen(), bean.getShortBitten(), bean.getOffColor(), bean.getBurned(), bean.getOrangePeelSkin(),bean.getAveranado(), bean.getDamageCausedByMushroom(), bean.getShells(), bean.getFirstTest(), bean.getSecondTest());
        
        return mapping.findForward(path);
    }
}
