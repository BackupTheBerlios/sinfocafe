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
        loadingPage="./pages/esp/defectos.html";
        function help() {
            open("<%=request.getContextPath()%>/jsp/aide/help.jsp", "target", "toolbar=0, directories=0, status=0, menubar=0, width=720, height=615, scrollbars=0, location=0, resizable=0");
        }
        </script>
    </head>    
    <body onload="total();">
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
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.size"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet-actif" ><bean:message key="tab.flaw"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.tasting"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" onclick="return valide()" ><bean:message key="tab.testResult"/></html:submit>
                        </div>
                        
                        <br />
                        <br>
                        <div class="sikfSectionTitre"><bean:message key="flaw.title"/></div>
                        <br />
                        <fieldset>
                            <div align="right"><a onclick="help()"><bean:message key="link.help" /></a></div>
                            <table border="1" bordercolor="#336633">
                                <tr>
                                    <td class="sikfDonneeAffichage"><bean:message key="flaw.number"/></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.flaw"/></td>
                                    <td  class="sikfLibelle"><bean:message key="flaw.equivalent"/></td>
                                    <td  class="sikfLibelle"><bean:message key="flaw.weighting"/></td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:text styleId="partiallyDamaged" property="partiallyDamaged" size="4" onkeyup="divideOpe('partiallyDamaged',3); total();" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.PartiallyDamaged"/></td>
                                    <td  class="sikfLibelle"><div id="partiallyDamagedT"></div></td>
                                    <td  class="sikfLibelle">3</td>                        
                                </tr>
                                
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:text styleId="partiallyBlack" property="partiallyBlack" size="4" onkeyup="divideOpe('partiallyBlack',2); total();" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.partiallyBlack"/></td>
                                    <td  class="sikfLibelle"><div id="partiallyBlackT"></div></td>
                                    <td  class="sikfLibelle">2</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:text styleId="cutIntoABatch" property="cutIntoABatch" size="4" onkeyup="divideOpe('cutIntoABatch',5); total();" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.cutIntoABatch"/></td>
                                    <td  class="sikfLibelle"><div id="cutIntoABatchT"></div></td>
                                    <td  class="sikfLibelle">5</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:text styleId="cutIntoALittle" property="cutIntoALittle" size="4" onkeyup="divideOpe('cutIntoALittle',10); total();" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.cutIntoALittle"/></td>
                                    <td  class="sikfLibelle"><div id="cutIntoALittleT"></div></td>
                                    <td  class="sikfLibelle">10</td>                        
                                </tr>
                                
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:text styleId="green" property="green" size="4" onkeyup="divideOpe('green',5); total();" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.green"/></td>
                                    <td  class="sikfLibelle"><div id="greenT"></div></td>
                                    <td  class="sikfLibelle">5</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:text styleId="shortBitten" property="shortBitten" size="4" onkeyup="divideOpe('shortBitten',5); total();" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.shortBitten"/></td>
                                    <td  class="sikfLibelle"><div id="shortBittenT"></div></td>
                                    <td  class="sikfLibelle">5</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:text styleId="offColor" property="offColor" size="4" onkeyup="divideOpe('offColor',5); total();" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.offColor"/></td>
                                    <td  class="sikfLibelle"><div id="offColorT"></div></td>
                                    <td  class="sikfLibelle">5</td>                        
                                </tr>
                                
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:text styleId="burned" property="burned" size="4" onkeyup="divideOpe('burned',5); total();" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.burned"/></td>
                                    <td  class="sikfLibelle"><div id="burnedT"></div></td>
                                    <td  class="sikfLibelle">5</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:text styleId="orangePeelSkin" property="orangePeelSkin" size="4" onkeyup="divideOpe('orangePeelSkin',1); total();" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.orangePeelSkin"/></td>
                                    <td  class="sikfLibelle"><div id="orangePeelSkinT"></div></td>
                                    <td  class="sikfLibelle">1</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:text styleId="averanado" property="averanado" size="4" onkeyup="divideOpe('averanado',5); total();" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.averanado"/></td>
                                    <td  class="sikfLibelle"><div id="averanadoT"></div></td>
                                    <td  class="sikfLibelle">5</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:text styleId="damageCausedByMushroom" property="damageCausedByMushroom" size="4" onkeyup="divideOpe('damageCausedByMushroom',1); total();" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.damageMushroom"/></td>
                                    <td  class="sikfLibelle"><div id="damageCausedByMushroomT"></div></td>
                                    <td  class="sikfLibelle">1</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:text styleId="shells" property="shells" size="4" onkeyup="divideOpe('shells',1); total();" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.shells"/></td>
                                    <td  class="sikfLibelle"><div id="shellsT"></div></td>
                                    <td  class="sikfLibelle">1</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"></td>     
                                    <td  class="sikfLibelle"><b><bean:message key="flaw.total"/></b></td>
                                    <td  class="sikfLibelle"><div id="total"></div></td>
                                    <td  class="sikfLibelle"></td>                        
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td class="sikfDonneeAffichage"><br /><html:reset styleClass="sikfBoutonAction"><bean:message key="button.reset"/></html:reset></td>
                                    
                                </tr>
                            </table>
                        </fieldset>
                    </html:form>
                    <script type="text/javascript"> 
            
            divideOpe('partiallyDamaged',3);
            divideOpe('partiallyBlack',2);
            divideOpe('cutIntoABatch',5);
            divideOpe('cutIntoALittle',10);
            divideOpe('green',5);
            divideOpe('shortBitten',5);
            divideOpe('offColor',5);
            divideOpe('burned',5);
            divideOpe('orangePeelSkin',1);
            divideOpe('averanado',5);
            divideOpe('damageCausedByMushroom',1);
            divideOpe('shells',1);
             
            var table = new Array(12);
             table[0] = "<bean:message key="warningFlaw.PartiallyDamaged"/>";
             table[1] = "<bean:message key="warningFlaw.partiallyBlack"/>";
             table[2] = "<bean:message key="warningFlaw.cutIntoABatch"/>";
             table[3] = "<bean:message key="warningFlaw.cutIntoALittle"/>";
             table[4] = "<bean:message key="warningFlaw.green"/>";
             table[5] = "<bean:message key="warningFlaw.shortBitten"/>";
             table[6] = "<bean:message key="warningFlaw.offColor"/>";
             table[7] = "<bean:message key="warningFlaw.burned"/>";
             table[8] = "<bean:message key="warningFlaw.orangePeelSkin"/>";
             table[9] = "<bean:message key="warningFlaw.averanado"/>";
             table[10] = "<bean:message key="warningFlaw.damageMushroom"/>";
             table[11] = "<bean:message key="warningFlaw.shells"/>";
             
             tab = new Array();
             tab[0]="partiallyDamaged";
             tab[1]="partiallyBlack";
             tab[2]="cutIntoABatch";
             tab[3]="cutIntoALittle";
             tab[4]="green";
             tab[5]="shortBitten";
             tab[6]="offColor";
             tab[7]="burned";
             tab[8]="orangePeelSkin";
             tab[9]="averanado";
             tab[10]="damageCausedByMushroom";
             tab[11]="shells";
             
             
 function divideOpe(number, coef)
        {
                var x = document.getElementById(number).value;
                if (x!="")
                {
                    var y = coef;
                    document.getElementById(number+"T").innerHTML=parseInt(x/y);            
                }
        }
        
        function total()
        {
             var total=0;
             for(i=0; i<=11; i++)
             {
                if(document.getElementById(tab[i]).value!=""){ total+= parseInt(document.getElementById(tab[i]+'T').firstChild.nodeValue);}           
             }
        document.getElementById('total').innerHTML=total; 
        }
        
        function valide() {
                var texte = "<bean:message key="warning.information"/>";
                var texte2 = "<bean:message key="warning.incorrecttype"/>";
                var texte3 = "<bean:message key="warning.incorrectvalue"/>";   

                var sem = 0;
                var sem2 = 0;
                var sem3 = 0;
                var test = 0;

                for (i=0;i<=11;i++) {
                    id = document.getElementById(tab[i]).value;
                    if (id != "") {test = 1;}
                }
                if (test == 0) {
                    document.getElementById('flaw').value = "false";
                    if (document.getElementById('greenCoffee').value == 'true' || document.getElementById('size').value == 'true') alert ("<bean:message key="warning.nothingButTest"/>");
                    return true;
                }
                if (test == 1) {
                    document.getElementById('flaw').value = "true";
                    for (i=0;i<=11;i++) {
                        x = document.getElementById(tab[i]).value;
                        if (x=="") {
                            texte+="\n- "+ table[i] +" <bean:message key="warning.needtobefilled"/>";	
                            sem=1;
                        }
                        else { 
                            if(!verif_numeric(x)) {
                                texte2+="\n- <bean:message key="warning.valueattribuated"/> " + table[i] + " <bean:message key="warning.notnumber"/>";	
                                sem2=1;
                            }
                            else {
                                if(x<0 || x>100) { 
                                    texte3+="\n- <bean:message key="warning.valueattribuated"/> " + table[i] + " <bean:message key="warning.negative100"/>"; 
                                    sem3=1;
                                }
                            }
                        } 

                    }
                }

                if (sem==1 || sem2==1 || sem3==1) {
                    if(sem==0) texte=""; else texte+='\n\n';
                    if(sem2==0) texte2=""; else texte2+='\n\n';
                    if(sem3==0) texte3=""; else texte3+='\n\n';

                    a=confirm(texte+texte2+texte3+" <bean:message key="warning.validity"/>");
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