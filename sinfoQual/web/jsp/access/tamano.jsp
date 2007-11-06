<!-- Début -->
<%@ page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib  uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"  media="screen">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ongletStyle.css"  media="screen">
        <title>Tamano</title>
        <script type="text/javascript">
        loadingPage="./pages/esp/tamano.html";
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
                            
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.greenCoffee"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet-actif" ><bean:message key="tab.size"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.flaw"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.tasting"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.testResult"/></html:submit>
                        </div>
                        <br> 
                        <br />
                        
                        <div class="sikfSectionTitre"><bean:message key="size.title"/></div>
                        <br />
                        <fieldset>
                            <div align="right"><a onclick="help()"><bean:message key="link.help" /></a></div>
                            <table border="1" bordercolor="#336633">
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="size.grainSize"/></td>
                                    <td  class="sikfLibelle"><bean:message key="size.grainCounted"/></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">21</td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="21" property="twentyOne" size="4" /></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">20</td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="20" property="twenty" size="4" /></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">19</td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="19" property="nineteen" size="4" /></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">18</td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="18" property="eighteen" size="4" /></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">17</td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="17" property="seventeen" size="4" /></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">16</td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="16" property="sixteen" size="4" /></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">15</td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="15" property="fifteen" size="4" /></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">14</td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="14" property="fourteen" size="4" /></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">13</td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="13" property="thirteen" size="4" /></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">12</td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="12" property="twelve" size="4" /></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">Total</td>
                                    <td class="sikfDonneeAffichage"><input id="totalSize" type="text" size="4"></td>                        
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
            function valide() {
                var texte = "<bean:message key="warning.information"/>";
                var texte2 = "<bean:message key="warning.incorrecttype"/>";
                var texte3 = "<bean:message key="warning.incorrectvalue"/>";   

                var sem  = 0;
                var sem2 = 0;
                var sem3 = 0;
                var test = 0;

                for (i=21;i>=12;i--) {
                    id = document.getElementById(i).value;
                    if (id != "") {test = 1;}
                }
                
                if (test == 0) {
                    document.getElementById('size').value = "false";
                    if (document.getElementById('greenCoffee').value == 'true' || document.getElementById('flaw').value == 'true') alert ("<bean:message key="warning.nothingButTest"/>");
                    return true;
                }
                if (test == 1) {
                    document.getElementById('size').value = "true";
                    for (i=21;i>=12;i--) {
                        id = document.getElementById(i).value;
                        if (id=="") {
                            texte+="\n- "+ i +" <bean:message key="warning.needtobefilled"/>";	
                            sem=1;
                        }
                        else { 
                            if(!verif_numeric(id)) {
                                texte2+="\n- <bean:message key="warning.valueattribuated"/> "+ i + " <bean:message key="warning.notnumber"/>";	
                                sem2=1;
                            }
                            else {
                                if(id<0 || id>400){ 
                                    texte3+="\n- <bean:message key="warning.valueattribuated"/> "+ i + " <bean:message key="warning.negative400"/>"; 
                                    sem3=1;
                                }
                            }
                        }
                    }
                }

                if (sem!=0 || sem2!=0 || sem3!=0) {
                    if(sem==0) texte=""; else texte+='\n\n';
                    if(sem2==0) texte2=""; else texte2+='\n\n';
                    if(sem3==0) texte3=""; else texte3+='\n\n';

                    a=confirm(texte+texte2+texte3+" <bean:message key="warning.validity"/>");
                    if (a==1){return true;}
                    return false;

                }

                //total entre 340 et 360
                var totalSize=0;
                for (i=21;i>=12;i--) {
                    totalSize+=parseInt(document.getElementById(i).value);
                }

                if (totalSize<340 || totalSize>360) {
                    alert('Attention! Le total doit faire 350.');
                    document.getElementById('totalSize').value=totalSize;
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