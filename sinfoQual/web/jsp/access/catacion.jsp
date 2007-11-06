<!-- Début -->
<%@ page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib  uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"  media="screen">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ongletStyle.css"  media="screen">
        <title><bean:message key="tasting.title" /></title>
        <script type="text/javascript">
        loadingPage="./pages/esp/catacion.html";
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
                            <html:hidden property="tasting" styleId="tasting" />
                            
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.greenCoffee"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.size"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.flaw"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet-actif" ><bean:message key="tab.tasting"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.testResult"/></html:submit>
                        </div>
                        
                        <br />
                        <br>
                        <div class="sikfSectionTitre"><bean:message key="tasting.title" /></div>
                        <br />
                        <fieldset>
                            <div align="right"><a onclick="help()"><bean:message key="link.help" /></a></div>
                            <table border="1" bordercolor="#336633">
                                <tr>
                                    <td class="sikfDonneeAffichage"><bean:message key="tasting.category" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="tasting.result" /></td>
                                    <td  class="sikfLibelle"><bean:message key="tasting.OthersAttributesAndCaracteristics" /></td>
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="tasting.perfum" /></td>    
                                    <td class="sikfDonneeAffichage"><html:text styleId="perfum" property="perfum" size="4" /></td>  
                                    <td class="sikfDonneeAffichage"><html:text property="perfumAdd" size="40" /></td>  
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="tasting.flavor" /></td>    
                                    <td class="sikfDonneeAffichage"><html:text styleId="flavor" property="flavor" size="4" /></td>  
                                    <td class="sikfDonneeAffichage"><html:text property="flavorAdd" size="40" /></td>  
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="tasting.body" /></td>    
                                    <td class="sikfDonneeAffichage"><html:text styleId="body" property="body" size="4" /></td>  
                                    <td class="sikfDonneeAffichage"><html:text property="bodyAdd" size="40" /></td>  
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="tasting.acidity" /></td>    
                                    <td class="sikfDonneeAffichage"><html:text styleId="acidity" property="acidity" size="4" /></td>  
                                    <td class="sikfDonneeAffichage"><html:text property="acidityAdd" size="40" /></td>  
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="tasting.residue" /></td>    
                                    <td class="sikfDonneeAffichage"><html:text styleId="residue" property="residue" size="4" /></td>  
                                    <td class="sikfDonneeAffichage"><html:text property="residueAdd" size="40" /></td>  
                                </tr>           
                            </table>
                            <table>
                                <tr>
                                    <td class="sikfDonneeAffichage"><br /><html:reset styleClass="sikfBoutonAction"><bean:message key="button.reset"/></html:reset></td>
                                </tr>
                            </table>
                        </fieldset>
                    </html:form>
                    <script language='javascript'>
                //Validation des données
                
             var table = new Array(5);
             table[0] = "<bean:message key="warningTasting.perfum"/>";
             table[1] = "<bean:message key="warningTasting.flavor"/>";
             table[2] = "<bean:message key="warningTasting.body"/>";
             table[3] = "<bean:message key="warningTasting.acidity"/>";
             table[4] = "<bean:message key="warningTasting.residue"/>";
             
             var tab = new Array(5);
             tab[0] = "perfum";
             tab[1] = "flavor";
             tab[2] = "body";
             tab[3] = "acidity";
             tab[4] = "residue";

function valide() {
                var header = "<bean:message key="warning.information"/>";
                var texte = "";
                var texte2 = "<bean:message key="warning.incorrecttype"/>";
                var texte3 = "<bean:message key="warning.incorrectvalue"/>";     

                var sem  = 0;
                var sem2 = 0;
                var sem3 = 0;
                var test = 0;

                for (i=0;i<=4;i++) {
                    id = document.getElementById(tab[i]).value;
                    if (id != "") test = 1;
                }
                if (test == 0) {
                    document.getElementById('tasting').value = "false";
                    return true;
                }
                else {
                    document.getElementById('tasting').value = "true";
                    for (i=0;i<=4;i++) {
                        x = document.getElementById(tab[i]).value;
                        if(x!="") {
                            if(!verif_numeric(x)) {
                                texte2 += "\n- <bean:message key="warning.valueattribuated"/> " + table[i] + " <bean:message key="warning.notnumber"/>";	
                                sem2 = 1;
                            }
                            else if(x<0 || x>10){ 
                                texte3 += "\n- <bean:message key="warning.valueattribuated"/> " + table[i] + " <bean:message key="warning.negative10"/>"; 
                                sem3 = 1 ;
                            }
                        }
                        else {
                            texte += "\n- "+ table[i] +" <bean:message key="warning.needtobefilled"/>";	
                            sem = 1;
                        }
                    }
                }

                if (sem2 != 0 || sem3 != 0 || sem != 0) {
                    if(sem  == 0) texte  = ""; else texte  += '\n\n';
                    if(sem2 == 0) texte2 = ""; else texte2 += '\n\n';
                    if(sem3 == 0) texte3 = ""; else texte3 += '\n\n';

                    a=confirm(header + texte + texte2+texte3+" <bean:message key="warning.validity"/>");
                    if (a==1){return true;}
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