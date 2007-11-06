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

    <script language="JavaScript">
            
	function afficheId(baliseId)
	  {
	  if (document.getElementById && document.getElementById(baliseId) != null)
		{
		document.getElementById(baliseId).style.visibility='visible';
		document.getElementById(baliseId).style.display='block';
		}
	  }
	
	function cacheId(baliseId)
	  {
	  if (document.getElementById && document.getElementById(baliseId) != null)
		{
		document.getElementById(baliseId).style.visibility='hidden';
		document.getElementById(baliseId).style.display='none';
		}
	  }
        
      function displayFunctionField() 
      {
        var choix = document.formulaire.case;
               
          if (choix.checked == true) 
          {
          cacheId('functionField');
          }
      }
    </script>
    
</head>    
<body>
        <script language="JavaScript">
    cacheId('functionField');
        </script>
    <%@include file="../leftMenu.jsp" %>
    <DIV id="sikfContenu">
    <DIV class="sikfSection">
    <DIV class="sikfSectionContenu">
<!-- Début -->
    <br /> 

<div class="sikfSectionTitre"><bean:message key="step3.title" /></div>
    
    <br />
    <form name="formulaire">
    <fieldset>
    <div align="right"><a onclick="window.open('help/step3Help.jsp',null,'resizable=yes,status=no,toolbar=yes,menubar=no,location=no');"><bean:message key="link.help" /></a></div>
    <table size="100%" cellpadding="10">
                <tr>
                        <td  class="sikfLibelle"><bean:message key="step3.nameField" /></td>
                        <td class="sikfDonneeAffichage"><input type="text"/></td>
                </tr>
                <tr>
                        <td  class="sikfLibelle"><bean:message key="step3.mandatoryField" /></td>
                        <td class="sikfDonneeAffichage">
                            <input type="radio" name="yes"/><bean:message key="word.yes" />
                            <input type="radio" name="no"/><bean:message key="word.no" />
                        </td>
                </tr>                
                <tr>
                        <td  class="sikfLibelle"><bean:message key="step3.typeField" /></td>
                        <td class="sikfDonneeAffichage">
                        <select property="type">
                                <option value="access"><bean:message key="word.integer" /></option>
                                <option value="modify"><bean:message key="word.float" /></option>
                                <option value="create"><bean:message key="word.pourcentage" /></option>
                        </select>

                        </td>
                </tr>
                <tr>
                        <td  class="sikfLibelle"><bean:message key="step3.boundMarker" /></td>
                        <td class="sikfDonneAffichage"><bean:message key="word.start" /><input type="text" size="10"/><bean:message key="word.end" /><input type="text" size="10"/></td>
                </tr>  
                                
                <tr>
                        <td  class="sikfLibelle"><bean:message key="step3.functionField" /></td>
                        <td class="sikfDonneeAffichage"><input type="checkbox" name="case" onclick="displayFunctionField();"/><bean:message key="step3.checkFunction" /></td>
                </tr>
                
                <div id="functionField">
                     <tr> 
                         <td>
                        <div class="sikfSectionTitre"><bean:message key="step3.functionField" /></div>
                        </td>
                    </tr>
                    <tr>
                        <td  class="sikfLibelle"><bean:message key="step3.nameFunction" /></td>
                        <td class="sikfDonneeAffichage"><input type="text"/></td>
                    </tr>
                    <tr>
                        <td  class="sikfLibelle"><bean:message key="step3.propertyFunction" /></td>
                        <td class="sikfDonneeAffichage"><input type="text"/></td>     
                    </tr>
                 </div>

                <tr>
                    <td class="sikfDonneeAffichage">
                    <input type="button" class="sikfBoutonAction" value="<bean:message key="button.confirm" />" onclick="window.location='step4_structureTest.jsp';" />&nbsp;<input type="button" class="sikfBoutonAction" value="<bean:message key="button.cancel" />" />
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