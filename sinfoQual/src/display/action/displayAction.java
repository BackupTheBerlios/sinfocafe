package display.action;

import display.bean.displayBean;
import display.bean.tabDetail;
import display.form.displayForm;
import hibernate.Results;
import hibernate.ResultsFacade;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;

public class displayAction extends Action {
    
    private String SUCCESS = "ok";
    private int typeOne = 0;
    private int typeTwo = 0;
    
    private tabDetail fillTable(Results bean) {
        ArrayList grain, mark;
        tabDetail detail = new tabDetail();
        
        detail.setFirstTest(bean.getFirstTest());
        detail.setSecondTest(bean.getSecondTest());
        
        try {
            detail.setHumidity(bean.getHumidity());
            detail.setColor(bean.getColor());
            detail.setSmell(bean.getSmell());
            detail.setDenseness(bean.getDenseness());
            detail.setUniformity(bean.getUniformity());
            detail.setComment(bean.getComment());
            detail.setTestNum(Integer.toString(bean.getId()));
            
            grain = findGrain(bean);
            
            detail.setBigGrain((String)grain.get(0));
            detail.setMediumGrain((String)grain.get(2));
            detail.setSmallGrain((String)grain.get(4));
            detail.setFirstGrain((String)grain.get(1));
            detail.setSecondGrain((String)grain.get(3));
            detail.setThirdGrain((String)grain.get(5));
        } catch (Exception e) {System.out.println("7 " + e);}
        
        mark = findMark(bean);
        
        if (bean.getFirstTest().equals("true") && bean.getSecondTest().equals("true")) {
            typeOne = 1;
            typeTwo = 1;
            try {detail.setFlawMark((String)mark.get(0));} catch (Exception e) {System.out.println("6 " + e);}
            try {detail.setTastingMark((String)mark.get(1));} catch (Exception e) {System.out.println("5 " + e);}
        } else if (bean.getFirstTest().equals("true")) {
            typeOne = 1;
            try {detail.setFlawMark((String)mark.get(0));} catch (Exception e) {System.out.println("4 " + e);}
        } else if (bean.getSecondTest().equals("true")) {
            typeTwo = 1;
            try {detail.setTastingMark((String)mark.get(0));} catch (Exception e) {System.out.println("3 " + e);}
        }
        return detail;
    }
    
    protected ArrayList classTab(ArrayList tmp) {
        
        String [] var, val, sup1, sup2, sup3;
        int i, cmpt = 0, max, cmpt2 = 0, nb = 0;
        ArrayList index = new ArrayList(), result = new ArrayList();
        String indice;
        
        sup1 = new String[2];
        sup2 = new String[2];
        sup3 = new String[2];
        sup1[1] = "0";
        sup2[1] = "0";
        sup3[1] = "0";
        
        max = tmp.size();
        while (cmpt != max){
            var = ((String [])tmp.get(cmpt));
            while (cmpt2 != max) {
                val = ((String [])tmp.get(cmpt2));
                if (val[0].equals(var[0])) {
                    nb = nb + Integer.parseInt(val[1]);
                    index.add(Integer.toString(cmpt2));
                }
                cmpt2++;
            }
            cmpt2 = 0;
            if (index.size() != 1) {
                max = max - index.size() + 1;
                indice = ((String)index.get(0));
                val = ((String [])tmp.get(Integer.parseInt(indice)));
                val[1] = Integer.toString(nb);
                for (i=index.size()-1;i>0;i--)
                    tmp.remove(Integer.parseInt(((String)index.get(i))));
            }
            index.clear();
            nb = 0;
            cmpt++;
        }
        
        max = tmp.size();
        cmpt = 0;
        while (cmpt != max) {
            var = (String []) tmp.get(cmpt);
            if (Integer.parseInt(var[1]) > Integer.parseInt(sup1[1])) {
                sup3 = sup2;
                sup2 = sup1;
                sup1 = var;
            } else if (Integer.parseInt(var[1]) > Integer.parseInt(sup2[1])) {
                sup3 = sup2;
                sup2 = var;
            } else if (Integer.parseInt(var[1]) > Integer.parseInt(sup3[1]))
                sup3 = var;
            
            cmpt++;
        }
        
        result.add(sup1);
        result.add(sup2);
        result.add(sup3);
        
        return result;
    }
    
    protected String formatPercent(String val) {
        return (Integer.toString(350*Integer.parseInt(val)/100));
    }
    
    protected String formatGramme(String val, int size) {
        return (Integer.toString(100*Integer.parseInt(val)/(size*350)));
    }
    
    private tabDetail fillResult(ArrayList tab) {
        tabDetail detail = new tabDetail();
        int cmpt = 0, type1 = 0, type2 = 0, size1 = 0, size2 = 0;
        int humidity = 0, denseness = 0;
        int tasting = 0, flaw = 0;
        ArrayList color = new ArrayList(), size = new ArrayList(), smell = new ArrayList(),
                uniformity = new ArrayList();
        String [] tmp, big, medium, small;
        while (cmpt != tab.size()) {
            if (((tabDetail)tab.get(cmpt)).getFirstTest().equals("true")) {
                size1++;
                type1 = 1;
                humidity += Integer.parseInt(((tabDetail)tab.get(cmpt)).getHumidity());
                denseness += Integer.parseInt(((tabDetail)tab.get(cmpt)).getDenseness());
                flaw += Integer.parseInt(((tabDetail)tab.get(cmpt)).getFlawMark());
                tmp = new String [2];
                tmp[0] = (((tabDetail)tab.get(cmpt)).getColor());
                tmp[1] = "1";
                color.add(tmp);
                tmp = new String [2];
                tmp[0] = (((tabDetail)tab.get(cmpt)).getSmell());
                tmp[1] = "1";
                smell.add(tmp);
                tmp = new String [2];
                tmp[0] = (((tabDetail)tab.get(cmpt)).getUniformity());
                tmp[1] = "1";
                uniformity.add(tmp);
                tmp = new String [2];
                tmp[0] = (((tabDetail)tab.get(cmpt)).getBigGrain());
                tmp[1] = formatPercent((((tabDetail)tab.get(cmpt)).getFirstGrain()));
                size.add(tmp);
                tmp = new String [2];
                tmp[0] = (((tabDetail)tab.get(cmpt)).getMediumGrain());
                tmp[1] = formatPercent((((tabDetail)tab.get(cmpt)).getSecondGrain()));
                size.add(tmp);
                tmp = new String [2];
                tmp[0] = (((tabDetail)tab.get(cmpt)).getSmallGrain());
                tmp[1] = formatPercent((((tabDetail)tab.get(cmpt)).getThirdGrain()));
                size.add(tmp);
            }
            if (((tabDetail)tab.get(cmpt)).getSecondTest().equals("true")) {
                size2++;
                type2 = 1;
                tasting += Integer.parseInt(((tabDetail)tab.get(cmpt)).getTastingMark());
            }
            cmpt++;
        }
        
        if (type1 == 1) {
            detail.setHumidity(Integer.toString(humidity/size1));
            detail.setDenseness(Integer.toString(denseness/size1));
            flaw = flaw/size1;
            detail.setFlawMark(Integer.toString(flaw));
            detail.setColor(((String [])classTab(color).get(0))[0]);
            detail.setSmell(((String [])classTab(smell).get(0))[0]);
            detail.setUniformity(((String [])classTab(uniformity).get(0))[0]);
            size = classTab(size);
            big = (String []) size.get(0);
            medium = (String []) size.get(1);
            small = (String []) size.get(2);
            
            detail.setBigGrain(big[0]);
            detail.setFirstGrain(formatGramme(big[1],size1));
            detail.setMediumGrain(medium[0]);
            detail.setSecondGrain(formatGramme(medium[1],size1));
            detail.setSmallGrain(small[0]);
            detail.setThirdGrain(formatGramme(small[1],size1));
        }
        if (type2 == 1) {
            tasting = tasting/size2;
            detail.setTastingMark(Integer.toString(tasting));
        }
        return detail;
    }
    
    public ActionForward execute(ActionMapping mapping, ActionForm  form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        if (form != null) {
            displayForm displayFormulaire = (displayForm)form;
            displayBean bean = new displayBean();
            BeanUtils.copyProperties(bean, displayFormulaire);
            
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            int id, i, beginDay = 0, beginMonth = 0, beginYear = 0, endDay = 0, endMonth = 0, endYear = 0;
            
            java.util.Date date = new java.util.Date();
            java.sql.Date beginDate= new java.sql.Date(date.getTime());
            java.sql.Date endDate= new java.sql.Date(date.getTime());
            
            if (bean.getBeginDate()!= "" && bean.getEndDate()!= ""){
                StringTokenizer str = new StringTokenizer(bean.getBeginDate(), " ");
                String day = str.nextToken();
                String month = str.nextToken();
                String year = str.nextToken();
                String tmp = year.concat("-").concat(month).concat("-").concat(day);
                beginDate = Date.valueOf(tmp);
                
                StringTokenizer str2 = new StringTokenizer(bean.getEndDate() , " ");
                String day2 = str2.nextToken();
                String month2 = str2.nextToken();
                String year2 = str2.nextToken();
                String tmp2 = year2.concat("-").concat(month2).concat("-").concat(day2);
                endDate = Date.valueOf(tmp2);
            } else {
                beginDate = Date.valueOf("1582-05-10");
                endDate = Date.valueOf("2582-05-10");
            }
            
            if ((bean.getBeginDate()!="" && bean.getEndDate()=="")||(bean.getBeginDate()=="" && bean.getEndDate()!="")) {
                if(bean.getBeginDate()!= ""){
                    StringTokenizer str = new StringTokenizer(bean.getBeginDate(), " ");
                    String day = str.nextToken();
                    String month = str.nextToken();
                    String year = str.nextToken();
                    String tmp = year.concat("-").concat(month).concat("-").concat(day);
                    beginDate = Date.valueOf(tmp);
                    endDate = Date.valueOf(tmp);
                } else{
                    StringTokenizer str = new StringTokenizer(bean.getEndDate(), " ");
                    String day = str.nextToken();
                    String month = str.nextToken();
                    String year = str.nextToken();
                    String tmp = year.concat("-").concat(month).concat("-").concat(day);
                    beginDate = Date.valueOf(tmp);
                    endDate = Date.valueOf(tmp);
                    bean.setBeginDate(bean.getEndDate());
                    bean.setEndDate("");
                }
                
            }
            
            if(bean.getId()=="") id = 0;
            else id = Integer.parseInt(bean.getId());
            
            ResultsFacade facade = new ResultsFacade();
            
            List result = facade.findByCyp(id,beginDate,endDate,bean.getProducerName(), bean.getInterestGroup(), bean.getOrganization(), bean.getTypeCoffee(), bean.getBatch());
            
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            try {
                if (result.size() == 0)
                    return mapping.findForward("fail");
                
                typeOne = 0;
                typeTwo = 0;
                for (i=0;i<result.size();i++) {
                    Results test = (Results)result.get(i);
                    bean.addTab(fillTable(test));
                }
                
                if (typeOne == 1) bean.setTypeOne("true");
                if (typeTwo == 1) bean.setTypeTwo("true");
                
                if (bean.getTab().size() != 1) {
                    bean.addResult(fillResult(bean.getTab()));
                }
            } catch (Exception e) {return mapping.findForward("fail");}
            
            displayFormulaire.setTab(bean.getTab());
            displayFormulaire.setResult(bean.getResult());
            
            request.setAttribute(mapping.getAttribute(), bean);
        }
        
        return mapping.findForward(SUCCESS);
    }
    
    private ArrayList findGrain(Results bean) {
        ArrayList grain = new ArrayList();
        int big = 0, medium = 0, small = 0, vBig = 0, vMedium = 0, vSmall = 0, i, size, value;
        
        if ((value = Integer.parseInt(bean.getTwelve())) > vBig) {
            vBig = value;
            big = 12;
        }
        
        if ((value = Integer.parseInt(bean.getThirteen())) > vBig) {
            vMedium = vBig;
            medium = big;
            vBig = value;
            big = 13;
        } else if (value > vMedium) {
            vSmall = vMedium;
            small = medium;
            vMedium = value;
            medium = 13;
        }
        
        if ((value = Integer.parseInt(bean.getFourteen())) > vBig) {
            vSmall = vMedium;
            small = medium;
            vMedium = vBig;
            medium = big;
            vBig = value;
            big = 14;
        } else if (value > vMedium) {
            vSmall = vMedium;
            small = medium;
            vMedium = value;
            medium = 14;
        } else if (value > vSmall) {
            vSmall = value;
            small = 14;
        }
        
        if ((value = Integer.parseInt(bean.getFifteen())) > vBig) {
            vSmall = vMedium;
            small = medium;
            vMedium = vBig;
            medium = big;
            vBig = value;
            big = 15;
        } else if (value > vMedium) {
            vSmall = vMedium;
            small = medium;
            vMedium = value;
            medium = 15;
        } else if (value > vSmall) {
            vSmall = value;
            small = 15;
        }
        
        if ((value = Integer.parseInt(bean.getSixteen())) > vBig) {
            vSmall = vMedium;
            small = medium;
            vMedium = vBig;
            medium = big;
            vBig = value;
            big = 16;
        } else if (value > vMedium) {
            vSmall = vMedium;
            small = medium;
            vMedium = value;
            medium = 16;
        } else if (value > vSmall) {
            vSmall = value;
            small = 16;
        }
        
        if ((value = Integer.parseInt(bean.getSeventeen())) > vBig) {
            vSmall = vMedium;
            small = medium;
            vMedium = vBig;
            medium = big;
            vBig = value;
            big = 17;
        } else if (value > vMedium) {
            vSmall = vMedium;
            small = medium;
            vMedium = value;
            medium = 17;
        } else if (value > vSmall) {
            vSmall = value;
            small = 17;
        }
        
        if ((value = Integer.parseInt(bean.getEighteen())) > vBig) {
            vSmall = vMedium;
            small = medium;
            vMedium = vBig;
            medium = big;
            vBig = value;
            big = 18;
        } else if (value > vMedium) {
            vSmall = vMedium;
            small = medium;
            vMedium = value;
            medium = 18;
        } else if (value > vSmall) {
            vSmall = value;
            small = 18;
        }
        
        if ((value = Integer.parseInt(bean.getNineteen())) > vBig) {
            vSmall = vMedium;
            small = medium;
            vMedium = vBig;
            medium = big;
            vBig = value;
            big = 19;
        } else if (value > vMedium) {
            vSmall = vMedium;
            small = medium;
            vMedium = value;
            medium = 19;
        } else if (value > vSmall) {
            vSmall = value;
            small = 19;
        }
        
        if ((value = Integer.parseInt(bean.getTwenty())) > vBig) {
            vSmall = vMedium;
            small = medium;
            vMedium = vBig;
            medium = big;
            vBig = value;
            big = 20;
        } else if (value > vMedium) {
            vSmall = vMedium;
            small = medium;
            vMedium = value;
            medium = 20;
        } else if (value > vSmall) {
            vSmall = value;
            small = 20;
        }
        
        if ((value = Integer.parseInt(bean.getTwentyOne())) > vBig) {
            vSmall = vMedium;
            small = medium;
            vMedium = vBig;
            medium = big;
            vBig = value;
            big = 21;
        } else if (value > vMedium) {
            vSmall = vMedium;
            small = medium;
            vMedium = value;
            medium = 21;
        } else if (value > vSmall) {
            vSmall = value;
            small = 21;
        }
        
        vBig = 100 * vBig / 350;
        vMedium = 100 * vMedium / 350;
        vSmall = 100 * vSmall / 350;
        
        grain.add(Integer.toString(big));
        grain.add(Integer.toString(vBig));
        grain.add(Integer.toString(medium));
        grain.add(Integer.toString(vMedium));
        grain.add(Integer.toString(small));
        grain.add(Integer.toString(vSmall));
        
        return grain;
    }
    
    private ArrayList findMark(Results bean) {
        ArrayList mark = new ArrayList();
        int flaw = 0;
        int tasting = 0;
        
        try {flaw = Integer.parseInt(bean.getPartiallyDamaged())/3 + Integer.parseInt(bean.getPartiallyBlack())/2 + Integer.parseInt(bean.getCutIntoABatch())/5 + Integer.parseInt(bean.getCutIntoALittle())/10 + Integer.parseInt(bean.getGreen())/5 + Integer.parseInt(bean.getShortBitten())/5 + Integer.parseInt(bean.getOffColor())/5 + Integer.parseInt(bean.getBurned())/5 + Integer.parseInt(bean.getOrangePeelSkin()) + Integer.parseInt(bean.getAveranado())/5 + Integer.parseInt(bean.getDamageCausedByMushroom()) + Integer.parseInt(bean.getShells());mark.add(Integer.toString(flaw));} catch (Exception e) {System.out.println("2 " + e);}
        try {tasting = Integer.parseInt(bean.getPerfum()) + Integer.parseInt(bean.getFlavor()) + Integer.parseInt(bean.getBody()) + Integer.parseInt(bean.getAcidity()) + Integer.parseInt(bean.getResidue()) + 50;mark.add(Integer.toString(tasting));} catch (Exception e) {System.out.println("1 " + e);}
        
        return mark;
    }
}
