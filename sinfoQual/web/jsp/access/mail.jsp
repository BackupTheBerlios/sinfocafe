<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
    <%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Mail</title>
        <style>
            body
            {
            margin: 0;
            font-family: "Verdana", Arial, sans-serif;
            font-size:11px;
            color:#ffffff;
            }
            
            #global
            {
            max-width:750px;
            padding-left:30px;
            }
            
            #mail
            {
            background-color:#336633;
            padding:0;
            margin:0;
            }
            
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
            
            /* Arrondi */	
            .arrondi{display:block}
            .arrondi *{
              display:block;
              height:1px;
              overflow:hidden;
              font-size:.01em;
              background:#336633}
            .arrondi1{
              margin-left:3px;
              margin-right:3px;
              padding-left:1px;
              padding-right:1px;
              border-left:1px solid #a7bda7;
              border-right:1px solid #a7bda7;
              background:#668c66}
            .arrondi2{
              margin-left:1px;
              margin-right:1px;
              padding-right:1px;
              padding-left:1px;
              border-left:1px solid #eaefea;
              border-right:1px solid #eaefea;
              background:#598359}
            .arrondi3{
              margin-left:1px;
              margin-right:1px;
              border-left:1px solid #598359;
              border-right:1px solid #598359;}
            .arrondi4{
              border-left:1px solid #a7bda7;
              border-right:1px solid #a7bda7}
            .arrondi5{
              border-left:1px solid #668c66;
              border-right:1px solid #668c66}
            .arrondifg{
              background:#336633}
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
    <br>
    <br>
   <div id="global" align="center">
        <html:form action="mail.do">
			  <b class="arrondi">
			  <b class="arrondi1"><b></b></b>
			  <b class="arrondi2"><b></b></b>
			  <b class="arrondi3"></b>
			  <b class="arrondi4"></b>
			  <b class="arrondi5"></b></b>			
                          <div class="arrondifg">
                          <table id="mail">
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
                          <b class="arrondi">
                              <b class="arrondi5"></b>
                              <b class="arrondi4"></b>
                              <b class="arrondi3"></b>
                              <b class="arrondi2"><b></b></b>
                          <b class="arrondi1"><b></b></b></b>            
            </html:form>
    </div>
    </body>
</html>
