<!-- Début -->
<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib  uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"  media="screen">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ongletStyle.css"  media="screen">
    <title><bean:message key="display.pageTitle" /></title>
    <script type="text/javascript">
        function printDiv() {
            contentPrintVar=document.getElementById('contentPrint').innerHTML;
            window.open('<%=request.getContextPath()%>/jsp/display/displayPopup.html',null,'resizable=yes,status=no,toolbar=no,menubar=yes,location=no,scrollbars=yes,screenX=0,screenY=0');
        }
    </script>
</head>    
<body>
<%@include file="../leftMenu.jsp" %>
<DIV id="sikfContenu">
<DIV class="sikfSection">
<DIV class="sikfSectionContenu">
<!-- Début -->
<br />
<html:form action="displayLogistics.do">
    <div align="center">
        <tr>
            <td class="sikfDonneeAffichage"><input type="button" class="sikfBoutonAction" value="<bean:message key="button.print" />" onclick="printDiv()" /></td>
            <td class="sikfDonneeAffichage"><html:submit styleClass="sikfBoutonAction" property="logistics" ><bean:message key="button.generate" /> </html:submit></td>                
            <td class="sikfDonneeAffichage"><input type="button" class="sikfBoutonAction" value="<bean:message key="button.mailTheResults" />" onclick="window.open('<%=request.getContextPath()%>/jsp/display/mail.jsp',null,' width=810, height=570,resizable=yes,status=no,toolbar=yes,menubar=no,location=no');"/></td>
        </tr>
    </div>
</html:form>
<div id="contentPrint">
<fieldset>
<div id="helpDiv" align="right"><a onclick="window.open('help/display_testHelp.jsp',null,'resizable=yes,status=no,toolbar=yes,menubar=no,location=no');"><bean:message key="link.help" /></a></div>
<div id="displayPart">
<table cellspacing="10">
<tr>
    <logic:notEmpty name="display" property="typeCoffee">
        <td class="sikfLibelle"><bean:message key="displayTest.typeProduct" /></td>
        <bean:define id="type" name="display" property="typeCoffee" />
        <td class="sikfDonneeAffichage"><bean:write name="type" /></td>
    </logic:notEmpty>
    <logic:empty name="display" property="typeCoffee"><td>&nbsp;&nbsp;</td></logic:empty>                        
    <td>&nbsp;&nbsp;</td>
    <td colspan="2"></td>
</tr>
<tr>
    <logic:notEmpty name="display" property="producerName">
        <td class="sikfLibelle"><bean:message key="displayTest.producer" /></td>
        <bean:define id="producer" name="display" property="producerName" />
        <td class="sikfDonneeAffichage"><bean:write name="producer" /></td>
    </logic:notEmpty>                      
    <td>&nbsp;&nbsp;</td>
    <logic:notEmpty name="display" property="interestGroup">
        <td class="sikfLibelle"><bean:message key="displayTest.interestGroup" /></td>
        <bean:define id="group" name="display" property="interestGroup" />
        <td class="sikfDonneeAffichage"><bean:write name="group" /></td>
    </logic:notEmpty>                       
    <td>&nbsp;&nbsp;</td>
    <logic:notEmpty name="display" property="organization">
        <td class="sikfLibelle"><bean:message key="displayTest.organization" /></td>
        <bean:define id="orga" name="display" property="organization" />
        <td class="sikfDonneeAffichage"><bean:write name="orga" /></td>
    </logic:notEmpty>                   
</tr>
<tr>
    <logic:notEmpty name="display" property="batch">
        <td class="sikfLibelle"><bean:message key="displayTest.batch" /></td>
        <bean:define id="batch" name="display" property="batch" />
        <td class="sikfDonneeAffichage"><bean:write name="batch" /></td>
    </logic:notEmpty>
    <td>&nbsp;&nbsp;</td>
    <logic:notEmpty name="display" property="beginDate">
        <td class="sikfLibelle"><bean:message key="displayTest.date" /></td>
        <td class="sikfDonneeAffichage">
        <bean:message key="displayTest.from" />
        <bean:define id="begin" name="display" property="beginDate" />
        &nbsp;&nbsp;<bean:write name="begin" />&nbsp;&nbsp;
    </logic:notEmpty>
    <logic:notEmpty name="display" property="endDate">
        <bean:message key="displayTest.to" />
        <bean:define id="end" name="display" property="endDate" />
        &nbsp;&nbsp;<bean:write name="end" />
    </logic:notEmpty>
    </td>
    <td></td>
    <td colspan="2"></td>
</tr>

</table>
<br>
<table border="1" bordercolor="#336633">
    <tr>
        <td class="sikLibelle" ><bean:message key="displayTest.identification" /></td>
        <logic:notEmpty name="display" property="typeOne">
            <td class="sikLibelle" ><bean:message key="displayTest.greenCoffee" /></td>
            <td class="sikLibelle" ><bean:message key="displayTest.size" /></td>
            <td class="sikLibelle" ><bean:message key="displayTest.default" /></td>
        </logic:notEmpty>
        <logic:notEmpty name="display" property="typeTwo">
            <td class="sikLibelle" ><bean:message key="displayTest.tasting" /></td>
        </logic:notEmpty>
    </tr>
    <logic:iterate id="table" name="display" property="tab" >
        <tr>
            <td>
                <table name="identification">
                    <tr>
                        <td class="sikLibelle" align="right"><bean:message key="displayTest.testNumber" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="testNum" /></td>
                    </tr>
                </table>
            </td>
            <logic:notEmpty name="display" property="typeOne" >
                <td>
                    <logic:notEmpty name="table" property="humidity">
                        <table name="greenCoffee">
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.greenCoffeeHumidity" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="humidity" /> %</td>
                            </tr>
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.greenCoffeeColor" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="color" /></td>
                            </tr>
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.greenCoffeeSmell" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="smell" /></td>
                            </tr>
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.greenCoffeeDenseness" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="denseness" /> g</td>
                            </tr>
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.greenCoffeeUniformity" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="uniformity" /></td>                         
                            </tr>
                            <logic:notEmpty name="table" property="comment">
                                <tr>
                                    <td class="sikLibelle" align="right"><bean:message key="displayTest.greenCoffeeComment" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="comment" /></td>
                                </tr>
                            </logic:notEmpty>
                        </table>
                    </logic:notEmpty>
                </td>
                <td>
                    <logic:notEmpty name="table" property="bigGrain">
                        <table name="size">
                            <tr>
                                <td class="sikLibelle" align="right"><bean:write name="table" property="bigGrain" /> :</td><td class="sikfDonneeAffichage"><bean:write name="table" property="firstGrain" />%</td>
                            </tr>
                            <tr>
                                <td class="sikLibelle" align="right"><bean:write name="table" property="mediumGrain" /> :</td><td class="sikfDonneeAffichage"><bean:write name="table" property="secondGrain" />%</td>
                            </tr>
                            <tr>
                                <td class="sikLibelle" align="right"><bean:write name="table" property="smallGrain" /> :</td><td class="sikfDonneeAffichage"><bean:write name="table" property="thirdGrain" />%</td>
                            </tr>
                        </table>
                    </logic:notEmpty>
                </td>
                <td>
                    <logic:notEmpty name="table" property="flawMark">
                        <table name="flaw">
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.mark" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="flawMark" /></td>
                            </tr>
                        </table>
                    </logic:notEmpty>
                </td>
            </logic:notEmpty>
            <logic:notEmpty name="display" property="typeTwo" >
                <td>
                    <logic:notEmpty name="table" property="tastingMark">
                        <table name="Tasting">
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.mark" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="tastingMark" /></td>
                            </tr>
                        </table>
                    </logic:notEmpty>
                </td>
            </logic:notEmpty>
        </tr>    
    </logic:iterate>
    <logic:notEmpty name="display" property="result" >
        <logic:iterate id="table" name="display" property="result" >
            <tr>
                <td>
                    <table name="average" align="center">
                        <tr>
                            <td class="sikLibelle"><bean:message key="displayTest.average" /></td>
                        </tr>
                    </table>
                </td>
                <logic:notEmpty name="display" property="typeOne" >
                    <td>
                        <table name="averageGreenCoffee">
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.greenCoffeeHumidity" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="humidity" /> %</td>
                            </tr>
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.greenCoffeeColor" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="color" /></td>
                            </tr>
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.greenCoffeeSmell" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="smell" /></td>
                            </tr>
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.greenCoffeeDenseness" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="denseness" /> g</td>
                            </tr>
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.greenCoffeeUniformity" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="uniformity" /></td>                         
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table name="averageSize">
                            <tr>
                                <td class="sikLibelle" align="right"><bean:write name="table" property="bigGrain" /> :</td><td class="sikfDonneeAffichage"><bean:write name="table" property="firstGrain" /> %</td>
                            </tr>
                            <tr>
                                <td class="sikLibelle" align="right"><bean:write name="table" property="mediumGrain" /> :</td><td class="sikfDonneeAffichage"><bean:write name="table" property="secondGrain" /> %</td>
                            </tr>
                            <tr>
                                <td class="sikLibelle" align="right"><bean:write name="table" property="smallGrain" /> :</td><td class="sikfDonneeAffichage"><bean:write name="table" property="thirdGrain" /> %</td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table name="averageFlaw">
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.average" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="flawMark" /></td>
                            </tr>
                        </table>
                    </td>
                    
                </logic:notEmpty>
                <logic:notEmpty name="display" property="typeTwo" >
                    <td>
                        <table name="averageTasting">
                            <tr>
                                <td class="sikLibelle" align="right"><bean:message key="displayTest.average" /></td><td class="sikfDonneeAffichage"><bean:write name="table" property="tastingMark" /></td>
                            </tr>
                        </table>
                    </td>    
                </logic:notEmpty>
            </tr>
        </logic:iterate>
    </logic:notEmpty>
</table>
</fieldset>
</div>



<!-- FIN -->
<div id="sikfPieddePage">
    <p>&copy; SINFOCAFE - Article 23</p>
</div>
</DIV></DIV></DIV>
</body>
</html>
<!-- FIN -->