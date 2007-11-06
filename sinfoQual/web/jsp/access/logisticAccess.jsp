<!-- D�but -->
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
        function printDiv() {
            contentPrintVar=document.getElementById('contentPrint').innerHTML;
            window.open('<%=request.getContextPath()%>/jsp/access/resultPopup.html',null,'resizable=yes,status=no,toolbar=no,menubar=yes,location=no,scrollbars=yes,screenX=0,screenY=0');
        }
        </script>
    </head>    
    <body onload="total();">
        <%@include file="../leftMenu.jsp" %>
        <DIV id="sikfContenu">
            <DIV class="sikfSection">
                <DIV class="sikfSectionContenu">        
                    <!-- D�but -->
                    <div align="right"><bean:write name="onglet" property="producerName" /></div>
                    
                    <html:form action="logisticAccess.do">
                        <br />
                        <div align="center">
                            <tr>
                                <td class="sikfDonneeAffichage"><input type="button" class="sikfBoutonAction" value="<bean:message key="button.print" />" onclick="printDiv()" /></td>
                                <td class="sikfDonneeAffichage"><html:submit property="logistics" styleClass="sikfBoutonAction" ><bean:message key="button.generate"/></html:submit></td>
                                <td class="sikfDonneeAffichage"><input type="button" class="sikfBoutonAction" value="<bean:message key="button.mailTheResults" />" onclick="window.open('<%=request.getContextPath()%>/jsp/access/mail.jsp',null,' width=810, height=570,resizable=yes,status=no,toolbar=yes,menubar=no,location=no');"/></td>
                            </tr>
                        </div>
                    </html:form>
                    <br>
                    <div id="contentPrint">
                        <fieldset>
                            <div id="helpDiv" align="right"><a onclick="window.open('help/resultHelp.jsp',null,'resizable=yes,status=no,toolbar=yes,menubar=no,location=no');"><bean:message key="link.help" /></a></div>
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
                                        <tr>
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
                            <logic:equal value="true" name="onglet" property="greenCoffee" >
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
                                    <logic:notEmpty name="onglet" property="comment" >
                                        <tr>
                                            <td  class="sikfLibelle"><bean:message key="greenCoffee.comment" /></td>
                                            <td class="sikfDonneeAffichage"><bean:write name="onglet" property="comment" /></td>
                                        </tr>
                                    </logic:notEmpty>
                                </table>
                            </logic:equal>
                            <logic:equal value="true" name="onglet" property="size">
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
                            </logic:equal>
                            <logic:equal value="true" name="onglet" property="flaw">
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
                            </logic:equal>
                            <logic:equal value="true" name="onglet" property="tasting" >
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
                            </logic:equal>
                        </fieldset>
                    </div>
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
