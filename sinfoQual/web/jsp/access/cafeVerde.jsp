<!-- Début -->
<%@ page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page language="java"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib  uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib  uri="http://struts.apache.org/tags-nested" prefix="nested"%>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"  media="screen">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ongletStyle.css"  media="screen">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
        <title>Cafe Verde</title> 
        <script type="text/javascript">
        loadingPage="./pages/esp/cafe_verde.html";
        function help() {
            open("<%=request.getContextPath()%>/jsp/aide/help.jsp", "target", "toolbar=0, directories=0, status=0, menubar=0, width=720, height=615, scrollbars=0, location=0, resizable=0");
        }
        </script>
    </head>    
    <body>
        <%@include file="../leftMenu.jsp" %>
        <DIV id="sikfContenu">
            <DIV class="sikfSection">
                <DIV class="sikfSectionContenu">
                    <div align="right"><bean:write name="onglet" property="producerName" /></div>
                    <!-- Début -->
        
                    <html:form action="accessTest.do">
                        <div class="menuOnglet">
                            <html:hidden property="greenCoffee" styleId="greenCoffee" />
                            <html:hidden property="flaw" styleId="flaw" />
                            <html:hidden property="size" styleId="size" />
                            <html:hidden property="tasting" styleId="tasting" />
                            
                            <html:submit property="ongletSubmit" styleClass="onglet-actif" ><bean:message key="tab.greenCoffee"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.size"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()"  ><bean:message key="tab.flaw"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.tasting"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.testResult"/></html:submit>
                        </div>
                        
                        <br>
                        <br>
                        
                        <div class="sikfSectionTitre"><bean:message key="greenCoffee.title"/></div>
                        
                        <br />
                        
                        <fieldset>
                            <div align="right"><a onclick="help()"><bean:message key="link.help" /></a></div>               
                            <table cellpadding="10">
                                <tr>
                                    <td  class="sikfLibelle"></td>
                                    <td class="sikfDonneeAffichage"></td>                        
                                    <td class="sikfDonneeAffichage"><b><bean:message key="greenCoffee.requirements"/></b></td>
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="greenCoffee.humidity"/></td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="humidity"  name="onglet" property="humidity"/></td>                        
                                    <td class="sikfDonneeAffichage">10-12%</td>
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="greenCoffee.color"/></td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="color" name="onglet" property="color" /></td>
                                    <td class="sikfDonneeAffichage"><bean:message key="word.green"/>&nbsp;<bean:message key="word.blue"/></td>
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="greenCoffee.smell"/></td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="smell" name="onglet" property="smell" /></td>
                                    <td class="sikfDonneeAffichage"><bean:message key="word.fresh"/></td>               
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="greenCoffee.denseness"/></td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="denseness" name="onglet" property="denseness" /></td>
                                    <td class="sikfDonneeAffichage">175g. +</td>
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="greenCoffee.uniformity"/></td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="uniformity" name="onglet" property="uniformity" /></td>
                                    <td class="sikfDonneeAffichage"><bean:message key="word.uniform"/></td>
                                </tr>
                                
                                <tr>
                                    <td class="sikfLibelle" valign="top"><bean:message key="greenCoffee.comment"/></td>
                                    <td class="sikfDonneeAffichage">
                                        <html:textarea styleId="" name="onglet" property="comment" styleClass="sikfDonneeAffichage" cols="50" rows="5"/>          
                                    </td>
                                </tr>            
                                
                            </table>
                            
                            
                            <table>
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:reset styleClass="sikfBoutonAction"><bean:message key="button.reset" /></html:reset></td>
                                </tr>
                            </table>
                        </fieldset>
                    </html:form>
                    <script language='javascript'>
                //Validation des donn&eacute;es
                function valide() {
                    var header = "<bean:message key="warning.information"/>";
                    var texte = "";
                    var texte2 = "<bean:message key="warning.incorrecttype"/>";
                    var sem = 0;
                    var sem2 = 0;
                    
                    if (document.getElementById('humidity').value=="" && document.getElementById('color').value=="" && document.getElementById('smell').value=="" && document.getElementById('denseness').value=="" && document.getElementById('uniformity').value=="") {
                        document.getElementById('greenCoffee').value = "false";
                        if (document.getElementById('size').value == 'true' || document.getElementById('flaw').value == 'true') alert ("<bean:message key="warning.nothingButTest"/>");
                        return true;
                    }
                    else {
                        document.getElementById('greenCoffee').value = "true";
                        if (document.getElementById('humidity').value=="") {
                            texte += "\n- <bean:message key="warningGreencoffee.humidity"/>";	
                            sem = 1;
                        }
                        if (document.getElementById('color').value=="") {
                            texte += "\n- <bean:message key="warningGreencoffee.color"/>";	
                            sem = 1;
                        }
                        if (document.getElementById('smell').value=="") {
                            texte += "\n- <bean:message key="warningGreencoffee.smell"/>";	
                            sem = 1;
                        }
                        if (document.getElementById('denseness').value=="") {
                            texte += "\n- <bean:message key="warningGreencoffee.denseness"/>";	
                            sem = 1;
                        }
                        if (document.getElementById('uniformity').value=="") {
                            texte += "\n- <bean:message key="warningGreencoffee.uniformity"/>";	
                            sem = 1;
                        }
                        if (!verif_numeric(document.getElementById('humidity').value) && document.getElementById('humidity').value != "") {
                            texte2 += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.humidity"/> <bean:message key="warning.notnumber"/>";
                            sem2 = 1;
                        }
                        if (!verif_numeric(document.getElementById('denseness').value) && document.getElementById('denseness').value != "") {
                            texte2 += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.denseness"/> <bean:message key="warning.notnumber"/>";
                            sem2 = 1;
                        }
                        if (verif_numeric(document.getElementById('color').value) && document.getElementById('color').value != "") {
                            texte2 += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.color"/> <bean:message key="warning.notString"/>";
                            sem2 = 1;
                        }
                        if (verif_numeric(document.getElementById('smell').value) && document.getElementById('smell').value != "") {
                            texte2 += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.smell"/> <bean:message key="warning.notString"/>";
                            sem2 = 1;
                        }
                        if (verif_numeric(document.getElementById('uniformity').value) && document.getElementById('uniformity').value != "") {
                            texte2 += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.uniformity"/> <bean:message key="warning.notString"/>";
                            sem2 = 1;
                        }
                    }

                    if (sem != 0 || sem2 != 0) {
                        if (sem == 0) texte=""; else texte  += "\n\n";
                        if (sem2 == 0) texte2=""; else texte2 += "\n\n";
                        a = confirm(header + texte + texte2 + "<bean:message key="warning.validity"/>");
                        if (a == 1){return true;}
                        return false;
                    }
                    return true;
                }
                function verif_numeric(variable) {
                    var exp = new RegExp("^\-?[0-9]+$","g");
                    return exp.test(variable);
                }                
                    </script>
                    
                    <!-- FIN -->
                    <div id="sikfPieddePage">
                        <p>&copy; SINFOCAFE - Article 23</p>
                    </div>
        </DIV></DIV></DIV>
        
    </body>
</html>
<!-- FIN -->