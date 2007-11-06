package session.action;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.RedirectingActionForward;

public class sessionAction extends Action {
   
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
        
      //r�cup�ration des param�tres pass�s et de l'url du refe(rer
      String link = request.getParameter("link");
      HttpSession session = request.getSession();
      String path, attribute;
      
      
      //On supprime tous les beans de la session sauf celui qui g�re la langue.
      Enumeration names = session.getAttributeNames();
      while (names.hasMoreElements()) {
          attribute = (String) names.nextElement();
          if (!attribute.equals("org.apache.struts.action.LOCALE"))
             session.removeAttribute(attribute);
      }
      
      // redirection vers une page d�finie par d�faut
      if( link.equals("main")) {
          path = link;
      }
      // redirection vers une page d�finie par d�faut
      else if( link.equals("access")) {
          path = link;
      }
      // redirection vers une page d�finie par d�faut
      else if( link.equals("create")) {
          path = link;
      }
      // redirection vers une page d�finie par d�faut
      else if( link.equals("display")) {
          path = link;
      }
      else {
          path = "failure";
      }

      return (mapping.findForward(path));
   }
}