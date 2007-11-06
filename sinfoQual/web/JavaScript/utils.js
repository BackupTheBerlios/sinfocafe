
function displayPrint() {
    window.open('jsp/display/print.jsp',null,'directories=no, tollbar=no');
}


//fonction qui permet de verifier que l'on provient de la page principale ou similaire
function alertSession() {
    var path = location.pathname;
        
    if (path.indexOf("/PAIR/session.do") == -1)
        confirm('<bean:message key="menu.quit" />');
    else if (path.indexOf("/PAIR/") == -1)
        confirm('<bean:message key="menu.quit" />');
    
    
}


/*
    return(confirm('Etes-vous sûr de vouloir effacer ce document?'));return false;
        var path = location.pathname;
        
        if (path.indexOf("/PAIR/session.do") == -1)
            confirm('<bean:message key="menu.quit" />');
        else if (path.indexOf("/PAIR/") == -1)
            confirm('<bean:message key="menu.quit" />');
        
 open("<%=request.getContextPath()%>/display/print.jsp","Impression","directories=no, tollbar=no");
 
 
 if (path.indexOf("/PAIR/session.do") == -1)
        alert('<bean:message key="menu.quit" />');
    else if (path.indexOf("/PAIR/") == -1)
        alert('<bean:message key="menu.quit" />');
        
    
        var path = location.pathname;
        
        if (path.indexOf("/PAIR/session.do") == -1)
            return(confirm('<bean:message key="menu.quit" />'));
        else if (path.indexOf("/PAIR/") == -1)
            return(confirm('<bean:message key="menu.quit" />'));
        return false;
    }
 */