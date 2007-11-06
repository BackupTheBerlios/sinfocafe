<!-- Début -->
<%@ page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib  uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"  media="screen">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ongletStyle.css"  media="screen">
        <title>Main page</title>
        <script type="text/javascript">
        loadingPage="./pages/esp/resumen.html";
        function help()
        {
        open("<%=request.getContextPath()%>/jsp/aide/help.jsp", "target", "toolbar=0, directories=0, status=0, menubar=0, width=720, height=615, scrollbars=0, location=0, resizable=0");
        }
        </script>
    </head>    
    <body onload="total();">
        <%@include file="../leftMenu.jsp" %>
        <DIV id="sikfContenu">
            <DIV class="sikfSection">
                <DIV class="sikfSectionContenu">        
                    <!-- Début -->
                    <div align="right"><bean:write name="onglet" property="producerName" /></div>
                    
                    <html:form action="accessTest.do">
                        <html:hidden property="greenCoffee" styleId="greenCoffee" />
                        <html:hidden property="flaw" styleId="flaw" />
                        <html:hidden property="size" styleId="size" />
                        <html:hidden property="tasting" styleId="tasting" />
                        <html:hidden property="firstTest" styleId="first" />
                        <html:hidden property="secondTest" styleId="second" />
                        <div class="menuOnglet">
                            <html:submit property="ongletSubmit" styleClass="onglet"><bean:message key="tab.greenCoffee"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" ><bean:message key="tab.size"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" ><bean:message key="tab.flaw"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet" ><bean:message key="tab.tasting"/></html:submit>
                            <html:submit property="ongletSubmit" styleClass="onglet-actif" ><bean:message key="tab.testResult"/></html:submit>
                        </div>
                        <br />
                        <br />
                        <div align="center">
                            <tr>
                                <td class="sikfDonneeAffichage"><html:submit onclick="return validation();" property="ongletSubmit" styleClass="sikfBoutonAction"><bean:message key="button.saveTheResults" /></html:submit></td>
                            </tr>
                        </div>
                    </html:form>
                    <fieldset>
                        <div align="right"><a onclick="help()"><bean:message key="link.help" /></a></div>
                        <div id="accessPart">
                            <table>
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="access.date" /></td>
                                    <td class="sikfDonneeAffichage"><bean:write name="onglet" property="date" /></td>
                                </tr>
                                <logic:notEmpty name="onglet" property="producerName" >
                                    <tr>
                                        <td class="sikfLibelle"><bean:message key="access.producer" /></td>
                                        <td class="sikfDonneeAffichage"><bean:write name="onglet" property="producerName" /></td>
                                    </tr>
                                </logic:notEmpty>
                                <logic:notEmpty name="onglet" property="interestGroup" >
                                    <tr>
                                        <td class="sikfLibelle"><bean:message key="access.interestGroup" /></td>
                                        <td class="sikfDonneeAffichage"><bean:write name="onglet" property="interestGroup" /></td>
                                    </tr>
                                </logic:notEmpty>
                                <logic:notEmpty name="onglet" property="batch" >
                                    </tr>
                                    <td class="sikfLibelle"><bean:message key="access.batch" /></td>
                                    <td class="sikfDonneeAffichage"><bean:write name="onglet" property="batch" /></td>
                                    </tr>
                                </logic:notEmpty>
                                <logic:notEmpty name="onglet" property="organization" >
                                    <tr>
                                        <td class="sikfLibelle"><bean:message key="access.organization" /></td>
                                        <td class="sikfDonneeAffichage"><bean:write name="onglet" property="organization" /></td>
                                    </tr>
                                </logic:notEmpty>
                                <logic:notEmpty name="onglet" property="typeCoffee" >
                                    <tr>
                                        <td class="sikfLibelle"><bean:message key="access.typeCoffee" /></td>
                                        <td class="sikfDonneeAffichage"><bean:write name="onglet" property="typeCoffee" /></td>
                                    </tr>
                                </logic:notEmpty>
                            </table>
                        </div>
                        <br />
                        <div id="greenField">
                            <div class="sikfSectionTitre"><bean:message key="result.greenCoffee" /></div>    
                            <br />
                            <table>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="greenCoffee.humidity" /></td>
                                    <td class="sikfDonneeAffichage"><div id="humidity"><bean:write name="onglet" property="humidity" /></div></td>
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="greenCoffee.color" /></td>
                                    <td class="sikfDonneeAffichage"><div id="color"><bean:write name="onglet" property="color" /></div></td>
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="greenCoffee.smell" /></td>
                                    <td class="sikfDonneeAffichage"><div id="smell"><bean:write name="onglet" property="smell" /></div></td>
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="greenCoffee.denseness" /></td>
                                    <td class="sikfDonneeAffichage"><div id="denseness"><bean:write name="onglet" property="denseness" /></div></td>
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="greenCoffee.uniformity" /></td>
                                    <td class="sikfDonneeAffichage"><div id="uniformity"><bean:write name="onglet" property="uniformity" /></div></td>
                                </tr>
                                <logic:notEmpty name="onglet" property="comment" >
                                    <tr>
                                        <td  class="sikfLibelle"><bean:message key="greenCoffee.comment" /></td>
                                        <td class="sikfDonneeAffichage"><bean:write name="onglet" property="comment" /></td>
                                    </tr>
                                </logic:notEmpty>
                            </table>  
                            <br />
                        </div>
                        <div id="sizeField">
                            <div class="sikfSectionTitre"><bean:message key="result.size" /></div>    
                            <br />
                            <table>
                                <tr>
                                    <td  class="sikfLibelle">21:</td>
                                    <td class="sikfDonneeAffichage"><div id="21"><bean:write name="onglet" property="twentyOne" /></div></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">20:</td>
                                    <td class="sikfDonneeAffichage"><div id="20"><bean:write name="onglet" property="twenty" /></div></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">19:</td>
                                    <td class="sikfDonneeAffichage"><div id="19"><bean:write name="onglet" property="nineteen" /></div></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">18:</td>
                                    <td class="sikfDonneeAffichage"><div id="18"><bean:write name="onglet" property="eighteen" /></div></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">17:</td>
                                    <td class="sikfDonneeAffichage"><div id="17"><bean:write name="onglet" property="seventeen" /></div></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">16:</td>
                                    <td class="sikfDonneeAffichage"><div id="16"><bean:write name="onglet" property="sixteen" /></div></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">15:</td>
                                    <td class="sikfDonneeAffichage"><div id="15"><bean:write name="onglet" property="fifteen" /></div></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">14:</td>
                                    <td class="sikfDonneeAffichage"><div id="14"><bean:write name="onglet" property="fourteen" /></div></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">13:</td>
                                    <td class="sikfDonneeAffichage"><div id="13"><bean:write name="onglet" property="thirteen" /></div></td>                        
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle">12:</td>
                                    <td class="sikfDonneeAffichage"><div id="12"><bean:write name="onglet" property="twelve" /></div></td>                        
                                </tr>
                            </table>
                            <br />
                        </div>
                        <div id="flawField">
                            <div class="sikfSectionTitre"><bean:message key="result.defaults" /></div>    
                            <br />
                            <table border="1" bordercolor="#336633">
                                <tr>
                                    <td class="sikfDonneeAffichage"><bean:message key="flaw.number" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.flaw" /></td>
                                    <td  class="sikfLibelle"><bean:message key="flaw.equivalent" /></td>
                                    <td  class="sikfLibelle"><bean:message key="flaw.weighting" /></td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><div id="partiallyDamaged"><bean:write name="onglet" property="partiallyDamaged" /></div></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.PartiallyDamaged" /></td>
                                    <td  class="sikfLibelle"><div id="partiallyDamagedT"></td>
                                    <td  class="sikfLibelle">3</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><div id="partiallyBlack"><bean:write name="onglet" property="partiallyBlack" /></div></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.partiallyBlack" /></td>
                                    <td  class="sikfLibelle"><div id="partiallyBlackT"></div></td>
                                    <td  class="sikfLibelle">2</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><div id="cutIntoABatch"><bean:write name="onglet" property="cutIntoABatch" /></div></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.cutIntoABatch" /></td>
                                    <td  class="sikfLibelle"><div id="cutIntoABatchT"></div></td>
                                    <td  class="sikfLibelle">5</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><div id="cutIntoALittle"><bean:write name="onglet" property="cutIntoALittle" /></div></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.cutIntoALittle" /></td>
                                    <td  class="sikfLibelle"><div id="cutIntoALittleT"></div></td>
                                    <td  class="sikfLibelle">10</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><div id="green"><bean:write name="onglet" property="green" /></div></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.green" /></td>
                                    <td  class="sikfLibelle"><div id="greenT"></div></td>
                                    <td  class="sikfLibelle">5</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><div id="shortBitten"><bean:write name="onglet" property="shortBitten" /></div></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.shortBitten" /></td>
                                    <td  class="sikfLibelle"><div id="shortBittenT"></div></td>
                                    <td  class="sikfLibelle">5</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><div id="offColor"><bean:write name="onglet" property="offColor" /></div></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.offColor" /></td>
                                    <td  class="sikfLibelle"><div id="offColorT"></div></td>
                                    <td  class="sikfLibelle">5</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><div id="burned"><bean:write name="onglet" property="burned" /></div></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.burned" /></td>
                                    <td  class="sikfLibelle"><div id="burnedT"></div></td>
                                    <td  class="sikfLibelle">5</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><div id="orangePeelSkin"><bean:write name="onglet" property="orangePeelSkin" /></div></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.orangePeelSkin" /></td>
                                    <td  class="sikfLibelle"><div id="orangePeelSkinT"></div></td>
                                    <td  class="sikfLibelle">1</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><div id="averanado"><bean:write name="onglet" property="averanado" /></div></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.averanado"/></td>
                                    <td  class="sikfLibelle"><div id="averanadoT"></div></td>
                                    <td  class="sikfLibelle">5</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><div id="damageCausedByMushroom"><bean:write name="onglet" property="damageCausedByMushroom" /></div></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.damageMushroom" /></td>
                                    <td  class="sikfLibelle"><div id="damageCausedByMushroomT"></div></td>
                                    <td  class="sikfLibelle">1</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"><div id="shells"><bean:write name="onglet" property="shells" /></div></td>     
                                    <td  class="sikfLibelle"><bean:message key="flaw.shells" /></td>
                                    <td  class="sikfLibelle"><div id="shellsT"></div></td>
                                    <td  class="sikfLibelle">1</td>                        
                                </tr>
                                <tr>
                                    <td class="sikfDonneeAffichage"></td>     
                                    <td  class="sikfLibelle"><b><bean:message key="flaw.total" /></b></td>
                                    <td  class="sikfLibelle"><div id="total"></div></td>
                                    <td  class="sikfLibelle"></td>                        
                                </tr>
                            </table>
                            <br />
                        </div>
                        <div id="tastingField">
                            <div class="sikfSectionTitre"><bean:message key="result.tasting" /></div>    
                            <br />
                            <table border="1" bordercolor="#336633">
                                <tr>
                                    <td class="sikfDonneeAffichage"><bean:message key="tasting.category" /></td>     
                                    <td  class="sikfLibelle"><bean:message key="tasting.result" /></td>
                                    <td  class="sikfLibelle"><bean:message key="tasting.OthersAttributesAndCaracteristics" /></td>
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="tasting.perfum" /></td>    
                                    <td class="sikfDonneeAffichage"><div id="perfum"><bean:write name="onglet" property="perfum" /></div></td>  
                                    <td class="sikfDonneeAffichage"><bean:write name="onglet" property="perfumAdd" /></td>  
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="tasting.flavor" /></td>    
                                    <td class="sikfDonneeAffichage"><div id="flavor"><bean:write name="onglet" property="flavor" /></div></td>  
                                    <td class="sikfDonneeAffichage"><bean:write name="onglet" property="flavorAdd" /></td>  
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="tasting.body" /></td>    
                                    <td class="sikfDonneeAffichage"><div id="body"><bean:write name="onglet" property="body" /></div></td>  
                                    <td class="sikfDonneeAffichage"><bean:write name="onglet" property="bodyAdd" /></td>  
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="tasting.acidity" /></td>    
                                    <td class="sikfDonneeAffichage"><div id="acidity"><bean:write name="onglet" property="acidity" /></div></td>  
                                    <td class="sikfDonneeAffichage"><bean:write name="onglet" property="acidityAdd" /></td>  
                                </tr>
                                <tr>
                                    <td  class="sikfLibelle"><bean:message key="tasting.residue" /></td>    
                                    <td class="sikfDonneeAffichage"><div id="residue"><bean:write name="onglet" property="residue" /></div></td>  
                                    <td class="sikfDonneeAffichage"><bean:write name="onglet" property="residueAdd" /></td>  
                                </tr>
                            </table>
                        </div>
                    </fieldset>
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
            
             var tab = new Array();
             tab[0]  = "partiallyDamaged";
             tab[1]  = "partiallyBlack";
             tab[2]  = "cutIntoABatch";
             tab[3]  = "cutIntoALittle";
             tab[4]  = "green";
             tab[5]  = "shortBitten";
             tab[6]  = "offColor";
             tab[7]  = "burned";
             tab[8]  = "orangePeelSkin";
             tab[9]  = "averanado";
             tab[10] = "damageCausedByMushroom";
             tab[11] = "shells";
             
        function divideOpe(number, coef) {
                var x = document.getElementById(number).innerHTML;
                if (x!="") {
                    var y = coef;
                    document.getElementById(number+"T").innerHTML=parseInt(x/y);            
                }
        }
        function total() {
             var total=0;
             for(i=0; i<=11; i++) {
                if(document.getElementById(tab[i]).innerHTML!=""){ 
                    total+= parseInt(document.getElementById(tab[i]+'T').firstChild.nodeValue);
                }           
             }
        document.getElementById('total').innerHTML = total; 
        }
                    </script>
                    <script type="text/javascript"> 
            function validation() {
            
            alert ('tasting ' + document.getElementById('tasting').value + '\nsize ' + document.getElementById('size').value + '\nflaw ' + document.getElementById('flaw').value + '\ngreen ' + document.getElementById('greenCoffee').value);
            
                var header = "<bean:message key="warning.information"/>\n\n";
                var vGreen = 0;
                var vGreen2 = 0;
                var testGreen = 1;
                var green = "<bean:message key="tab.greenCoffee" />";
                var greenType = "<bean:message key="warning.incorrecttype"/>";

                //VALIDATION DE CAFE
                if (document.getElementById('humidity').innerHTML=="" && document.getElementById('color').innerHTML=="" && document.getElementById('smell').innerHTML=="" && document.getElementById('denseness').innerHTML=="" && document.getElementById('uniformity').innerHTML=="") {
                    testGreen = 0;
                    document.getElementById('greenCoffee').value = "false";
                    if (document.getElementById('size').value == 'true' || document.getElementById('flaw').value == 'true') {
                        green += "\n<bean:message key="warning.nothingButTest"/>";
                        testGreen = -1;
                    }
                }
                else {
                    document.getElementById('greenCoffee').value = "true";
                    if (document.getElementById('humidity').innerHTML=="") {
                        green += "\n- <bean:message key="warningGreencoffee.humidity"/>";	
                        vGreen = 1;
                    }
                    if (document.getElementById('color').innerHTML=="") {
                        green += "\n- <bean:message key="warningGreencoffee.color"/>";	
                        vGreen = 1;
                    }
                    if (document.getElementById('smell').innerHTML=="") {
                        green += "\n- <bean:message key="warningGreencoffee.smell"/>";	
                        vGreen = 1;
                    }
                    if (document.getElementById('denseness').innerHTML=="") {
                        green += "\n- <bean:message key="warningGreencoffee.denseness"/>";	
                        vGreen = 1;
                    }
                    if (document.getElementById('uniformity').innerHTML=="") {
                        green += "\n- <bean:message key="warningGreencoffee.uniformity"/>";	
                        vGreen = 1;
                    }
                    if (!verif_numeric(document.getElementById('humidity').innerHTML) && document.getElementById('humidity').value != "") {
                        greenType += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.humidity"/> <bean:message key="warning.notnumber"/>";
                        vGreen2 = 1;
                    }
                    if (!verif_numeric(document.getElementById('denseness').innerHTML) && document.getElementById('denseness').value != "") {
                        greenType += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.denseness"/> <bean:message key="warning.notnumber"/>";
                        vGreen2 = 1;
                    }
                    if (verif_numeric(document.getElementById('color').value) && document.getElementById('color').value != "") {
                        greenType += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.color"/> <bean:message key="warning.notString"/>";
                        vGreen2 = 1;
                    }
                    if (verif_numeric(document.getElementById('smell').value) && document.getElementById('smell').value != "") {
                        greenType += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.smell"/> <bean:message key="warning.notString"/>";
                        vGreen2 = 1;
                    }
                    if (verif_numeric(document.getElementById('uniformity').value) && document.getElementById('uniformity').value != "") {
                        greenType += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.uniformity"/> <bean:message key="warning.notString"/>";
                        vGreen2 = 1;
                    }
                    if (vGreen2 == 1) green += "\n" + greenType;
                    if (vGreen  == 0 && vGreen2 == 0 && testGreen == 1) testGreen = 2;
                }
                //FIN DE VALIDATION DE CAFE


                //VALIDATION TAILLE
                var sizeType = "<bean:message key="warning.incorrecttype"/>";
                var sizeValue = "<bean:message key="warning.incorrectvalue"/>";   
                var size = "<bean:message key="tab.size"/>"

                var vSize = 0;
                var vSize2 = 0;
                var vSize3 = 0;
                var testSize = 0;

                for (i=21;i>=12;i--) {                        
                    id = document.getElementById(i).innerHTML;
                    if (id != "") {testSize = 1;}
                } 
                if (testSize == 0) {
                    document.getElementById('size').value = "false";
                    if (document.getElementById('greenCoffee').value == 'true' || document.getElementById('flaw').value == 'true') {
                        size += "\n<bean:message key="warning.nothingButTest"/>";
                        testSize = -1;
                    }
                }
                else {
                    document.getElementById('size').value = "true";
                    for (i=21;i>=12;i--) {                        
                        id = document.getElementById(i).innerHTML;
                        if (id=="") {
                            size += "\n- " + i +" <bean:message key="warning.needtobefilled"/>";	
                            vSize = 1;
                        }
                        else { 
                            if(!verif_numeric(id)) {
                                sizeType += "\n- <bean:message key="warning.valueattribuated"/> " + i + " <bean:message key="warning.notnumber"/>";	
                                vSize2 = 1;
                            }
                            else {
                                if(id<0 || id>400) { 
                                    sizeValue += "\n- <bean:message key="warning.valueattribuated"/> " + i + " <bean:message key="warning.negative400"/>"; 
                                    vSize3 = 1;
                                }
                            }

                        }     
                    }
                    if (vSize2 == 1) size += "\n" + sizeType;
                    if (vSize3 == 1) size += "\n" + sizeValue;
                    if (vSize == 0 && vSize2 == 0 && vSize3 == 0 && testSize == 1) testSize = 2;
                }
                //FIN DE VALIDATION DE TAILLE


                //VALIDATION DEFAULT  
                var flawTable = new Array(12);
                flawTable[0] = "<bean:message key="warningFlaw.PartiallyDamaged"/>";
                flawTable[1] = "<bean:message key="warningFlaw.partiallyBlack"/>";
                flawTable[2] = "<bean:message key="warningFlaw.cutIntoABatch"/>";
                flawTable[3] = "<bean:message key="warningFlaw.cutIntoALittle"/>";
                flawTable[4] = "<bean:message key="warningFlaw.green"/>";
                flawTable[5] = "<bean:message key="warningFlaw.shortBitten"/>";
                flawTable[6] = "<bean:message key="warningFlaw.offColor"/>";
                flawTable[7] = "<bean:message key="warningFlaw.burned"/>";
                flawTable[8] = "<bean:message key="warningFlaw.orangePeelSkin"/>";
                flawTable[9] = "<bean:message key="warningFlaw.averanado"/>";
                flawTable[10] = "<bean:message key="warningFlaw.damageMushroom"/>";
                flawTable[11] = "<bean:message key="warningFlaw.shells"/>";

                var flawTab = new Array();
                flawTab[0]="partiallyDamaged";
                flawTab[1]="partiallyBlack";
                flawTab[2]="cutIntoABatch";
                flawTab[3]="cutIntoALittle";
                flawTab[4]="green";
                flawTab[5]="shortBitten";
                flawTab[6]="offColor";
                flawTab[7]="burned";
                flawTab[8]="orangePeelSkin";
                flawTab[9]="averanado";
                flawTab[10]="damageCausedByMushroom";
                flawTab[11]="shells";

                var flaw = "<bean:message key="tab.flaw"/>";
                var flawType = "<bean:message key="warning.incorrecttype"/>";
                var flawValue = "<bean:message key="warning.incorrectvalue"/>";

                var vFlaw = 0;
                var vFlaw2 = 0;
                var vFlaw3 = 0;
                var testFlaw = 0;

                for (i=0;i<=11;i++) {
                    id = document.getElementById(flawTab[i]).innerHTML;
                    if (id != "") testFlaw = 1;
                }
                if (testFlaw == 0) {
                    document.getElementById('flaw').value = "false";
                    if (document.getElementById('greenCoffee').value == 'true' || document.getElementById('size').value == 'true') {
                        flaw += "\n<bean:message key="warning.nothingButTest"/>";
                        testFlaw = -1;
                    }
                }
                else {
                    document.getElementById('flaw').value = "true";
                    for (i=0;i<=11;i++) {
                        x = document.getElementById(flawTab[i]).innerHTML;
                        if (x=="") {
                            flaw += "\n- "+ flawTable[i] +" <bean:message key="warning.needtobefilled"/>";	
                            vFlaw = 1;
                        }
                        else { 
                            if(!verif_numeric(x)) {
                                flawType += "\n- <bean:message key="warning.valueattribuated"/> " + flawTable[i] + " <bean:message key="warning.notnumber"/>";	
                                vFlaw2 = 1;
                            }
                            else {
                                if(x<0 || x>100) { 
                                    flawValue += "\n- <bean:message key="warning.valueattribuated"/> " + flawTable[i] + " <bean:message key="warning.negative100"/>"; 
                                    vFlaw3 = 1;
                                }
                            }
                        }
                    }
                    if (vFlaw2 == 1) flaw += "\n" + flawType;
                    if (vFlaw3 == 1) flaw += "\n" + flawValue;
                    if (vFlaw == 0 && vFlaw2 == 0 && vFlaw3 == 0 && testFlaw == 1) testFlaw = 2;
                }
                //FIN DE VALIDATION de DEFAULT


                //VALIDATION CATACION
                var idTab = new Array(5);
                idTab[0] = "perfum";
                idTab[1] = "flavor";
                idTab[2] = "body";
                idTab[3] = "acidity";
                idTab[4] = "residue";

                var idTable = new Array(5);
                idTable[0] = "<bean:message key="warningTasting.perfum"/>";
                idTable[1] = "<bean:message key="warningTasting.flavor"/>";
                idTable[2] = "<bean:message key="warningTasting.body"/>";
                idTable[3] = "<bean:message key="warningTasting.acidity"/>";
                idTable[4] = "<bean:message key="warningTasting.residue"/>";

                var tastingType = "<bean:message key="warning.incorrecttype"/>";
                var tastingValue = "<bean:message key="warning.incorrectvalue"/>";    
                var tasting = "\n\n<bean:message key="tab.tasting"/>";    

                var vTasting = 0;
                var vTasting2 = 0;
                var testTasting = 0;
                
                if (document.getElementById('tasting').value == "true") {
                    for (i=0;i<=4;i++) {
                        x = document.getElementById(idTab[i]).innerHTML;
                        if (x != "") {testTasting = 1;}
                    }
                    if (testTasting == 0) document.getElementById('tasting').value = "false";
                    else {
                        document.getElementById('tasting').value = "true";
                        for (i=0;i<=4;i++) {
                            x = document.getElementById(idTab[i]).innerHTML;
                            if(x != "") {
                                if(!verif_numeric(x)) {
                                    tastingType += "\n- <bean:message key="warning.valueattribuated"/> " + idTable[i] + " <bean:message key="warning.notnumber"/>";	
                                    vTasting = 1;
                                }
                                else {
                                    if(x<0 || x>10){ 
                                        tastingValue += "\n- <bean:message key="warning.valueattribuated"/> " + idTable[i] + " <bean:message key="warning.negative10"/>"; 
                                        vTasting2 =  1 ;
                                    }
                                }
                            }
                            else
                                tasting += "\n- "+ idTable[i] +" <bean:message key="warning.needtobefilled"/>";
                        }
                        if (vTasting == 1) tasting += "\n" + tastingType;
                        if (vTasting2 == 1) tasting += "\n" + tastingValue;
                        if (vTasting == 0 && vTasting2 == 0 && testTasting == 1) testTasting = 2;
                    }
                }
                //FIN DE VALIDATION CATACION

                if (testGreen == 2 && testSize == 2 && testFlaw == 2 && testTasting == 2) {
                    document.getElementById('firstTest').value = "true";
                    document.getElementById('secondTest').value = "true";
                    return true;
                }
                else if (testGreen == 2 && testSize == 2 && testFlaw == 2 && testTasting == 0) {
                    document.getElementById('firstTest').value = "true";
                    return true;
                }
                else if (testGreen == 0 && testSize == 0 && testFlaw == 0 && testTasting == 2) {
                    document.getElementById('secondTest').value = "true";
                    return true;
                }
                else if (testGreen != 0 || testSize != 0 || testFlaw != 0 || testTasting != 0) {
                    if(testGreen    == 0) green = "\n\n";   else green += "\n\n";
                    if(testSize     == 0) size = "\n\n";    else size += "\n\n";
                    if(testFlaw     == 0) flaw = "\n\n";    else flaw += "\n\n";
                    if(testTasting  == 0) tasting = "\n\n"; else tasting += "\n\n";
                    alert(header + green + size + flaw + tasting);
                    return false;
                }
                else if (testGreen == 0 && testSize == 0 && testFlaw == 0 && testTasting == 0) {
                    alert('<bean:message key="result.error" />');
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
