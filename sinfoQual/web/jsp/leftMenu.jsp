<script type="text/javascript">
function alertSession() 
{
    var path = location.pathname;    
    if (path.charAt(6) != 's' && path.length != 6)
    {
            a=confirm('<bean:message key="menu.quit" />'); 
            if(a==0){return false;}
    }
}
</script>

<div id="sikfEntete">
    <input type="image" src="<%=request.getContextPath()%>/images/logo_fapecafes.jpg" alt="FAPECAFES"> 
    <div class="iconePrincipale"></div>
</div>
<DIV id="sikfNavigation">
    <DIV class="sikfTitreApplication">SInfoCafé</DIV>
    <DIV class="sikfMenu">
        <fieldset>
            <DIV class="sikfMenuNiveau1"><html:link page='/session.do?link=main'    onclick="return alertSession()" ><bean:message key="menu.main" /></html:link></DIV>
            <br />
            <DIV class="sikfMenuNiveau2"><html:link page='/session.do?link=access'  onclick="return alertSession()" ><bean:message key="menu.access" /></html:link></DIV>
            <br />
            <DIV class="sikfMenuNiveau2"><html:link page='/session.do?link=create'  onclick="return alertSession()" ><bean:message key="menu.create" /></html:link></DIV>
            <br />
            <DIV class="sikfMenuNiveau2"><html:link page='/session.do?link=display' onclick="return alertSession()" ><bean:message key="menu.display" /></html:link></DIV>			
        </fieldset>
        <br>
        <logic:notPresent name="onglet">
            <logic:notPresent name="display">
                <fieldset>
                    <div align="center">
                        <html:link page='/langue.do?lang=en'><img width="25" height="15" src="<%=request.getContextPath()%>/images/flag/flagEn.jpg" style="border-style:none;"></html:link>&nbsp;
                        <html:link page='/langue.do?lang=fr'><img width="25" height="15" src="<%=request.getContextPath()%>/images/flag/flagFr.jpg" style="border-style:none;"></html:link>&nbsp;
                        <html:link page='/langue.do?lang=es'><img width="25" height="15" src="<%=request.getContextPath()%>/images/flag/flagEs.jpg" style="border-style:none;"></html:link>&nbsp;
                    </div>
                </fieldset>
            </logic:notPresent>
        </logic:notPresent>
    </DIV>
</DIV>