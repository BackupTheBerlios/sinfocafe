<!-- Début -->
<%@ page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page language="java"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib  uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@page import="java.util.*"%>
<%@page import="hibernate.*"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"  media="screen">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ongletStyle.css"  media="screen">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
        <title>Main page</title>
        <script type="text/javascript">
        <% ProducerFacade facade = new ProducerFacade();
        List producers = facade.findByIdSup(0);
        Producer producer = (Producer)producers.get(0);%>
        var interestGroup = new Array('<%=producer.getInterest_group()%>'
        <%for (int i=1;i<producers.size();i++){producer = (Producer)producers.get(i);%>
        ,'<%=producer.getInterest_group()%>'<%}%>);
        
        <%producer = (Producer)producers.get(0);%>
        var tab=new Array('<%=producer.getName()%>'
        <%for (int i=1;i<producers.size();i++){producer = (Producer)producers.get(i);%>
        ,'<%=producer.getName()%>'<%}%>);
        
        <%producer = (Producer)producers.get(0);%>
        var orga = new Array('<%=producer.getOrganization()%>'
        <%for (int i=1;i<producers.size();i++){producer = (Producer)producers.get(i);%>
        ,'<%=producer.getOrganization()%>'<%}%>);
        
        <% CaracteristicsFacade facade2 = new CaracteristicsFacade();
        List listCaracteristics = facade2.findCaracteristics();
        Caracteristics caracteristics = (Caracteristics)listCaracteristics.get(0);%>
        
        
        
    function go(alpha){ 
    var aff=document.getElementById('liste');
    var affiche=aff.getElementsByTagName('li');

    // à chaque caractère tapé, on vide la liste de résultats précédente
    while(aff.lastChild)aff.removeChild(aff.lastChild);

    // on supprime les accents pour comparaison
    for(i=0;i != tab.length;i++){  
    tab2=tab[i].replace(/[àâä]/gi,'a'); 
    tab2=tab2.replace(/[éèêë]/gi,'e'); 
    tab2=tab2.replace(/[ïî]/gi,'i'); 
    tab2=tab2.replace(/[ôö]/gi,'o'); 
    tab2=tab2.replace(/[ùüû]/gi,'u'); 
    alpha=alpha.replace(/[àâä]/gi,'a'); 
    alpha=alpha.replace(/[éèêë]/gi,'e'); 
    alpha=alpha.replace(/[ïî]/gi,'i'); 
    alpha=alpha.replace(/[ôö]/gi,'o'); 
    alpha=alpha.replace(/[ùüû]/gi,'u'); 

    // on supprime les majuscules et on cherche une correspondance
    if(tab2.toLowerCase().indexOf(alpha.toLowerCase())==0){ 
    if(alpha){
    // pour chaque correspondance, on crée un nouvel item dans la liste
    var el=document.createElement("li"); 
    var tx=document.createTextNode(tab[i]); 
    // en cliquant sur l'item, on donne sa valeur à la zone de texte et on efface la liste de sélection
    el.onclick=function(){document.getElementById('producer').value=this.firstChild.data;aff.style.display='none'};
    el.appendChild(tx);
    aff.appendChild(el)};};
    };

    var total=affiche.length;// nombre de résultats trouvés

    if(total==0){// Si résultats = 0
    // création d'un item vide (conformité xhtml: pas de liste vide)
    var el=document.createElement("li"); 
    var tx=document.createTextNode(" "); 
    el.appendChild(tx);
    aff.style.display='none';// liste invisible
    aff.appendChild(el);}
    // sinon, on affiche les correspondances trouvées.
    else aff.style.display='block';
    }  
	
    function verifName()
    {
    var a=0;
        for (var i=0; i<tab.length; i++){
        if (document.getElementById('producer').value==tab[i]){a=1;}
        }
    if(a==0){alert('<bean:message key="warning.incorrectProducer"/>'); return false;}
    return validateAcess();
    }
    
    </script>
        <!-- FICHIER DE STYLE DU CALENDRIER //-->
        <link rel='stylesheet' href='<%=request.getContextPath()%>/css/gnoocalendar.css' />
        <!-- FICHIER DE SCRIPT DU CALENDRIER //-->
        <script type="text/javascript" src="<%=request.getContextPath()%>/JavaScript/gnoocalendar.js"></script>
        <script type="text/javascript">
/******************************/
self.defaultStatus = "GnooCalendar 1.4";
//http://www.javascriptfr.com/codes/GNOOCALENDAR-CALENDRIER-DYNAMIQUE-VERSION-OBJET_25255.aspx
/******************************/
/* 
* instanciation de l'objet
*/
var CL = new GnooCalendar("CL", 10, 10 );
/******************************/
function init()
{
	//CL.init("calend", document.forms["testform"].elements["date"]);
       CL.init("calend", document.getElementById('testform').elements["date"]);
	CL.isDragable(true);
}
/******************************/
        </script>
        <script type="text/javascript">
        function displayDate(x) {
            if(x==0) document.getElementById("date").style.display="none";
            else     document.getElementById("date").style.display="";
        }
        </script>
        <script type="text/javascript">
        loadingPage="./pages/esp/filtro_del_test.html";
        function help()
        {
        open("<%=request.getContextPath()%>/jsp/aide/help.jsp", "target", "toolbar=0, directories=0, status=0, menubar=0, width=720, height=615, scrollbars=0, location=0, resizable=0");
        }
        </script>
        <script type="text/javascript">
function validateAcess() {
            var header = "<bean:message key="warning.information"/>\n";
            var date   = "";
            var access = "";
            var texte = "";
            var sem    = 0;

            //Champs obligatoires
            if (document.getElementById('producer').value=="" && document.getElementById('interestGroup').value=="" && document.getElementById('organization').value==""){
                access = "<bean:message key="access.obligatory"/>\n - <bean:message key="access.producer"/> \n - <bean:message key="access.interestGroup"/> \n - <bean:message key="access.organization"/>";
                sem = 1;
            }
            if (document.getElementById('date').value==""){
                date = "<bean:message key="access.dateObligatory"/>";
                sem = 1;
            }
            if (!verif_numeric(document.getElementById('batch').value) && document.getElementById('batch').value != "") {
                sem = 1;
                texte += "\n- <bean:message key="warning.valueattribuated"/> " + "<bean:message key="access.batch" />" + " <bean:message key="warning.notnumber"/>";
            }
            if (verif_numeric(document.getElementById('interestGroup').value)) {
                sem = 1;
                texte += "\n- <bean:message key="warning.valueattribuated"/> " + "<bean:message key="access.batch" />" + " <bean:message key="warning.notString"/>";
            }
            if (sem == 1) {
                alert(header + date + access + texte);
                return false;
            }
        }
        function verif_numeric(variable) {
            var exp = new RegExp("^\-?[0-9]+$","g");
            return exp.test(variable);
        }
        </script>
    </head>    
    <body onload="init(); displayDate(0);">
        <%@include file="../leftMenu.jsp" %>
        <DIV id="sikfContenu">
            <DIV class="sikfSection">
                <DIV class="sikfSectionContenu">
                    <!-- Début -->
                    <br />                
                    <div class="sikfSectionTitre"><bean:message key="access.title" /></div>
                    <br />  
                    
                    <html:form action="access.do" styleId="testform">
                        <fieldset>
                            <div align="right"><a onclick="help()"><bean:message key="link.help" /></a></div>         
                            <table size="100%">
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="access.producer" /></td>
                                    <td class="sikfDonneeAffichage"><html:text property="producerName" onkeyup="go(this.value)" styleId="producer" /></td>
                                </tr>
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="access.interestGroup" /></td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="interestGroup" property="interestGroup" /></td>
                                </tr>
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="access.organization" /></td>
                                    <td class="sikfDonneeAffichage">
                                        <html:select styleId="organization" property="organization">
                                            <option value=""><bean:message key="access.chooseOrganization" /></option>
                                            <%for (int i=0;i<listCaracteristics.size();i++){
                                                caracteristics = (Caracteristics)listCaracteristics.get(i);
                                                if (caracteristics.getOrganization() != null) {%>
                                            <option value="<%=caracteristics.getOrganization()%>"><%=caracteristics.getOrganization()%></option><%}}%>)
                                    </html:select></td>
                                </tr>
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="access.typeCoffee" /></td>
                                    <td class="sikfDonneeAffichage">
                                        <html:select property="typeCoffee">
                                            <option value=""><bean:message key="access.chooseCoffee" /></option>
                                            <%for (int i=0;i<listCaracteristics.size();i++){
                                                caracteristics = (Caracteristics)listCaracteristics.get(i);
                                                if (caracteristics.getTypeOfCoffee() != null) {%>
                                            <option value="<%=caracteristics.getTypeOfCoffee()%>"><%=caracteristics.getTypeOfCoffee()%></option><%}}%>)
                                    </html:select></td>
                                </tr>
                                </tr>
                                <td class="sikfLibelle"><bean:message key="access.batch" /></td>
                                <td class="sikfDonneeAffichage"><html:text styleId="batch" property="batch" size="3" /></td>
                                </tr>
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="access.date" /></td>
                                    <td class="sikfDonneeAffichage"><html:text property="date" styleId="date" size="10"/> <input type="button" class="sikfBoutonAction" name="show1" value='<bean:message key="button.date" />' onclick="displayDate(1);CL.show();" /></td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:submit styleClass="sikfBoutonAction" onclick="return verifName();" ><bean:message key="button.confirm" /></html:submit></td>
                                </tr>
                            </table>
                            <br>
                            <table><tr><td><ul id="liste" style="list-style-type:none;"><li></li></ul></td></tr></table>
                        </fieldset>
                    </html:form>
                    
                    <!-- Calendar    -->
                    <br>
                    <div id="calend" style="border: solid 0px #000000;visibility: hidden;">
                        &nbsp;
                    </div>
                    <!-- Calendar -->   
                    <!-- FIN -->
                    <div id="sikfPieddePage">
                        <p>&copy; SINFOCAFE - Article 23</p>
                    </div>
        </DIV></DIV></DIV>
    </body>
</html>
<!-- FIN -->