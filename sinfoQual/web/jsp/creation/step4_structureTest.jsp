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
    <title><bean:message key="creation.pageTitle" /></title>

</head>    
<body>
    <%@include file="../leftMenu.jsp" %>
    <DIV id="sikfContenu">
    <DIV class="sikfSection">
    <DIV class="sikfSectionContenu">
<!-- Début -->
    <br /> 

<div class="sikfSectionTitre"><bean:message key="step4.title" /></div>
    
    <br />
    <form>
    <fieldset>
    <div align="right"><a onclick="window.open('help/step4Help.jsp',null,'resizable=yes,status=no,toolbar=yes,menubar=no,location=no');"><bean:message key="link.help" /></a></div>
    <table size="100%" cellpadding="10">
                <tr>
                        <td  class="sikfLibelle"><bean:message key="step4.field1" /></td>
                        <td  class="sikfLibelle"><bean:message key="step4.fieldName" /></td>
                </tr>
                <tr>
                        <td  class="sikfLibelle"><bean:message key="step4.field2" /></td>
                        <td  class="sikfLibelle"><bean:message key="step4.fieldName" /></td>
                </tr>
                <tr>
                        <td  class="sikfLibelle"><bean:message key="step4.field3" /></td>
                        <td  class="sikfLibelle"><bean:message key="step4.fieldName" /></td>
                </tr>
                
                <tr>
                        <td  class="sikfLibelle"></td>
                        <td  class="sikfLibelle"></td>
                </tr>
                
                <tr>
                        <td  class="sikfLibelle"><bean:message key="step4.addFunction" /></td>
                        <td class="sikfDonneeAffichage"><input type="checkbox"/></td>
                </tr>
               
                <tr> 
                <td>
                <div class="sikfSectionTitre"><bean:message key="step4.nameFunction" /></div>
                </td>
                </tr>
                <tr>
                        <td  class="sikfLibelle"><bean:message key="step4.nameFunction" /></td>
                        <td class="sikfDonneeAffichage"><input type="text"/></td>
                </tr>
                <tr>
                        <td  class="sikfLibelle"><bean:message key="step4.propertyFunction" /></td>
                        <td class="sikfDonneeAffichage"><input type="text"/></td>     
                </tr> 
                
                <tr>
                    <td class="sikfDonneeAffichage">
                    <input type="submit" class="sikfBoutonAction" value="<bean:message key="button.confirm" />" />&nbsp;<input type="button" class="sikfBoutonAction" value="<bean:message key="button.cancel" />" />
                    </td>
                </tr>
    </table>
    </fieldset>
    </form>
 <!-- FIN -->
    <div id="sikfPieddePage">
        <p>&copy; SINFOCAFE - Article 23</p>
    </div>
    </DIV></DIV></DIV>
    </body>
</html>
 <!-- FIN -->