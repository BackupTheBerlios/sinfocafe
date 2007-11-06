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
            function confirmation()
            {
                var x=confirm("Are you sure to save these informations into your database?")
                if (x==0) {return false;} else  {return true}
            }
        </script>
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
                                <td class="sikfDonneeAffichage"><html:submit onclick="return confirmation()" property="ongletSubmit" styleClass="sikfBoutonAction"><bean:message key="button.saveTheResults" /></html:submit></td>
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
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="access.producer" /></td>
                                    <td class="sikfDonneeAffichage"><bean:write name="onglet" property="producerName" /></td>
                                </tr>
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="access.interestGroup" /></td>
                                    <td class="sikfDonneeAffichage"><bean:write name="onglet" property="interestGroup" /></td>
                                </tr>
                                </tr>
                                <td class="sikfLibelle"><bean:message key="access.batch" /></td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="batch" /></td>
                                </tr>
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="access.organization" /></td>
                                    <td class="sikfDonneeAffichage"><bean:write name="onglet" property="organization" /></td>
                                </tr>
                                <tr>		                
                                    <td  class="sikfLibelle"><bean:message key="access.selectProduct" /></td> 
                                    <td class="sikfDonneeAffichage"><bean:write name="onglet" property="product" /></td>
                                </tr>
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="access.typeCoffee" /></td>
                                    <td class="sikfDonneeAffichage"><bean:write name="onglet" property="typeCoffee" /></td>
                                </tr>
                            </table>
                        </div>   
                        <br />
                        <div class="sikfSectionTitre"><bean:message key="result.greenCoffee" /></div>    
                        <br />
                        <table>
                            <tr>
                                <td  class="sikfLibelle"><bean:message key="greenCoffee.humidity" /></td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="humidity" /></td>
                            </tr>
                            <tr>
                                <td  class="sikfLibelle"><bean:message key="greenCoffee.color" /></td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="color" /></td>
                            </tr>
                            <tr>
                                <td  class="sikfLibelle"><bean:message key="greenCoffee.smell" /></td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="smell" /></td>
                            </tr>
                            <tr>
                                <td  class="sikfLibelle"><bean:message key="greenCoffee.denseness" /></td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="denseness" /></td>
                            </tr>
                            <tr>
                                <td  class="sikfLibelle"><bean:message key="greenCoffee.uniformity" /></td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="uniformity" /></td>
                            </tr>
                            <tr>
                                <td  class="sikfLibelle"><bean:message key="greenCoffee.comment" /></td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="comment" /></td>
                            </tr>                
                        </table>  
                        <br />
                        <div class="sikfSectionTitre"><bean:message key="result.size" /></div>    
                        <br />
                        <table>
                            <tr>
                                <td  class="sikfLibelle">21:</td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="twentyOne" /></td>                        
                            </tr>
                            <tr>
                                <td  class="sikfLibelle">20:</td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="twenty" /></td>                        
                            </tr>
                            <tr>
                                <td  class="sikfLibelle">19:</td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="nineteen" /></td>                        
                            </tr>
                            <tr>
                                <td  class="sikfLibelle">18:</td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="eighteen" /></td>                        
                            </tr>
                            <tr>
                                <td  class="sikfLibelle">17:</td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="seventeen" /></td>                        
                            </tr>
                            <tr>
                                <td  class="sikfLibelle">16:</td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="sixteen" /></td>                        
                            </tr>
                            <tr>
                                <td  class="sikfLibelle">15:</td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="fifteen" /></td>                        
                            </tr>
                            <tr>
                                <td  class="sikfLibelle">14:</td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="fourteen" /></td>                        
                            </tr>
                            <tr>
                                <td  class="sikfLibelle">13:</td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="thirteen" /></td>                        
                            </tr>
                            <tr>
                                <td  class="sikfLibelle">12:</td>
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="twelve" /></td>                        
                            </tr>
                        </table>
                        
                        <br />
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
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="perfum" /></td>  
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="perfumAdd" /></td>  
                            </tr>
                            <tr>
                                <td  class="sikfLibelle"><bean:message key="tasting.flavor" /></td>    
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="flavor" /></td>  
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="flavorAdd" /></td>  
                            </tr>
                            <tr>
                                <td  class="sikfLibelle"><bean:message key="tasting.body" /></td>    
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="body" /></td>  
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="bodyAdd" /></td>  
                            </tr>
                            <tr>
                                <td  class="sikfLibelle"><bean:message key="tasting.acidity" /></td>    
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="acidity" /></td>  
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="acidityAdd" /></td>  
                            </tr>
                            <tr>
                                <td  class="sikfLibelle"><bean:message key="tasting.residue" /></td>    
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="residue" /></td>  
                                <td class="sikfDonneeAffichage"><bean:write name="onglet" property="residueAdd" /></td>  
                            </tr>
                        </table>
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
                var x = document.getElementById(number).innerHTML;
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
                if(document.getElementById(tab[i]).innerHTML!=""){ total+= parseInt(document.getElementById(tab[i]+'T').firstChild.nodeValue);}           
             }
        document.getElementById('total').innerHTML=total; 
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
