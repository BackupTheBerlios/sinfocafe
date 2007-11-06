<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
    <%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Mail</title>
        <style>
            #mailTextarea
            {
            width:500px;
            height:300px;
            }
            
            .mailField
            {
            width:500px;
            }
            
            #fileJoin
            {
            display:none;
            }
            
            a:hover
            {
            cursor:pointer;
            font-weight:bold;
            
            }
        </style>
        <script type="text/javascript">
function validateMail()
{

       
        var param=document.getElementById('fileJoinField').value;
        document.getElementById('path').value=param;
        
	var x="";
	var y="Les champs ci-dessous sont obligatoires:\n";
	var z=0;//passe à 1 qd un champs obligatoire n'est pas complété
	
	//Avertissement sur les champs vides
	if (document.getElementById('object').value=="") {x+="-Object\n";}
	if (document.getElementById('mailTextarea').value=="") {x+="-Mail\n";}

	
	if (x!="")//demande de confirmation sur les champs volontairement laissés vides
	{
		var a=confirm("Attention! Voulez-vous continuer sans remplir ces champs:\n"+x);
		if (a==0){return false;}
	}
	
	//Champs obligatoires
	if (document.getElementById('recipient').value=="") {y+="-Recipient\n"; z=1;}
	if (document.getElementById('smtp').value=="") {y+="-SMTP\n"; z=1;}
		
	if (z==1){alert(y); return false;}
        
        return true;
}

function fileJoin()
{	
	document.getElementById('fileJoin').style.display="block";
	setTimeout("hide()",5000);
}
function hide()
{
	if(document.getElementById('fileJoinField').value.length==0){document.getElementById('fileJoin').style.display="none";}
}
        </script>
    </head>
    
    <body>
        <html:form action="mail.do">
            <table>
                <tr>
                    <td><bean:message key="mail.identity"/> </td><td><html:text styleClass="mailField" property="from" /></td>
                </tr>
                <tr>
                    <td><bean:message key="mail.to"/></td><td><html:text styleClass="mailField" property="to" styleId="recipient" /></td>
                </tr>
                <tr>
                    <td><bean:message key="mail.cc"/></td><td><html:text styleClass="mailField" property="cc" /></td>
                </tr>
                <tr>
                    <td><bean:message key="mail.subject"/></td><td><html:text styleClass="mailField" property="object" styleId="object" /></td>
                </tr>
                <tr>
                    <td></td><td><a onclick="fileJoin()"><bean:message key="mail.attachment"/></a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div id="fileJoin">
                            <html:hidden property="path" styleId="path" />
                            <html:file styleClass="mailField" property="file" styleId="fileJoinField" onclick="init()"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td></td><td><html:textarea property="corps" styleId="mailTextarea" /></td>
                </tr>
                <tr>
                    <td><bean:message key="mail.smtp"/></td><td><html:text styleClass="mailField" property="smtp" styleId="smtp" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><html:submit onclick="return validateMail();"><bean:message key="mail.send"/></html:submit></td>
                </tr>
            </table>
        </html:form>
    </body>
</html>
