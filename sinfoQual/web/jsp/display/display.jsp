<!-- Début -->
<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
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
        <title><bean:message key="display.pageTitle" /></title>
        
        <script type="text/javascript" src="<%=request.getContextPath()%>/JavaScript/calendar.js"></script>
        <script type="text/javascript"> 
    <% ProducerFacade facade = new ProducerFacade();
        List producers = facade.findByIdSup(0);
        Producer producer = (Producer)producers.get(0);%>
        var tab=new Array('<%=producer.getName()%>'
        <%for (int i=1;i<producers.size();i++){producer = (Producer)producers.get(i);%>
        ,'<%=producer.getName()%>'<%}%>); 
                        
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

    if((total==0) || (total>=10)){// Si résultats = 0 ou > 3
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
    if(a==0){alert('Producer doesn\'t exist'); return false;}
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
        CL.init("calend", document.getElementById('testform').elements["date"]);
	CL.isDragable(true);
}
/******************************/
        </script>
        <script type="text/javascript">
        function displayDate(x)
        {
            if(x==0){
                document.getElementById("date").style.display="none";
                document.getElementById("date2").style.display="none";
            }
            if(x==1){document.getElementById("date").style.display="";}
            if(x==2){document.getElementById("date2").style.display="";}
        }
        function validateDisplay() {
            var header = "<bean:message key="warning.information"/>";
            var texte = "";
            var sem    = 0;

            //Champs obligatoires
            if (!verif_numeric(document.getElementById('batch').value) && document.getElementById('batch').value != "") {
                sem = 1;
                texte += "\n- <bean:message key="warning.valueattribuated"/> " + "<bean:message key="displaySelect.batch" />" + " <bean:message key="warning.notnumber"/>";
            }
            if (verif_numeric(document.getElementById('interestGroup').value)) {
                sem = 1;
                texte += "\n- <bean:message key="warning.valueattribuated"/> " + "<bean:message key="displaySelect.interestGroup" />" + " <bean:message key="warning.notString"/>";
            }
            if (!verif_numeric(document.getElementById('idTest').value) && document.getElementById('idTest').value != "") {
                sem = 1;
                texte += "\n- <bean:message key="warning.valueattribuated"/> " + "<bean:message key="displaySelect.id" />" + " <bean:message key="warning.notnumber"/>";
            }
            if (document.getElementById('idTest').value == "" && document.getElementById('producer').value == "" && document.getElementById('interestGroup').value == "" && document.getElementById('organization').value == "" && document.getElementById('date').value == "" && document.getElementById('date2').value == "" && document.getElementById('batch').value == "" && document.getElementById('typeOfCoffee').value == "") {
                sem = 1;
                texte = "\n<bean:message key="warning.noInformation"/>"; 
            }
            if (sem == 1) {
                alert(header + texte);
                return false;
            }
            return true;
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
                    <br>
                    <div class="sikfSectionTitre"><bean:message key="displaySelect.title" /></div>
                    <br>  
                    
                    <html:form styleId="testform" action="display.do" >
                        <fieldset>
                            <div align="right"><a onclick="window.open('help/displayHelp.jsp',null,'resizable=yes,status=no,toolbar=yes,menubar=no,location=no');"><bean:message key="link.help" /></a></div>
                            <table size="100%">
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="displaySelect.id" /></td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="idTest" property="id" size="4" /></td>
                                </tr>
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="displaySelect.producer" /></td>
                                    <td class="sikfDonneeAffichage"><html:text property="producerName" onkeyup="go(this.value)" styleId="producer" /></td>
                                </tr>
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="displaySelect.interestGroup" /></td>
                                    <td class="sikfDonneeAffichage"><html:text styleId="interestGroup" property="interestGroup" /></td>
                                </tr>
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="displaySelect.organization" /></td>
                                    <td class="sikfDonneeAffichage">
                                        <html:select styleId="organization" property="organization">
                                            <option value=""><bean:message key="displaySelect.chooseOrganization" /></option>
                                            <option value="APECAP">APECAP</option>
                                            <option value="PROCAP">PROCAP</option>
                                            <option value="APECAM">APECAM</option>
                                            <option value="PROCAFEQ">PROCAFEQ</option>
                                    </html:select></td>
                                </tr>
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="displaySelect.typeCoffee" /></td>
                                    <td class="sikfDonneeAffichage">
                                        <html:select styleId="typeOfCoffee" property="typeCoffee">
                                            <option value=""><bean:message key="displaySelect.chooseCoffee" /></option>
                                            <option value="<bean:message key="word.green" />"><bean:message key="word.green" /></option>
                                            <option value="<bean:message key="word.black" />"><bean:message key="word.black" /></option>
                                    </html:select></td>
                                </tr>
                                </tr>
                                <td class="sikfLibelle"><bean:message key="displaySelect.batch" /></td>
                                <td class="sikfDonneeAffichage"><html:text styleId="batch" property="batch" size="3" /></td>
                                </tr>
                                <tr>
                                    <td class="sikfLibelle"><bean:message key="displaySelect.date" /></td>
                                    <td class="sikfDonneeAffichage">
                                        <bean:message key="displaySelect.form" />
                                        <html:text property="beginDate" styleId="date" value="" size="10"/>
                                        <input type="button" class="sikfBoutonAction" name="show1" value="<bean:message key="button.date" />" onclick="displayDate(1); CL.setTarget(document.getElementById('testform').elements['date']); CL.show();" />
                                        <bean:message key="displaySelect.to" />
                                        <html:text property="endDate" styleId="date2" value="" size="10"/>
                                        <input type="button" class="sikfBoutonAction" name="show2" value="<bean:message key="button.date" />" onclick="displayDate(2); CL.setTarget(document.getElementById('testform').elements['date2']); CL.show();" />                        
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td class="sikfDonneeAffichage"><html:submit styleClass="sikfBoutonAction" onclick="return verifName(); return validateDisplay()"><bean:message key="button.confirm" /></html:submit></td>
                                </tr>
                            </table>
                            <div align="left"><ul id="liste" style="list-style-type:none;"><li> </li></ul></div>
                        </fieldset>
                    </html:form>
                    <!-- Calendar -->
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