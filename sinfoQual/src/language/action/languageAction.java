package language.action;

import java.io.IOException;
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

public class languageAction extends Action {
   
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
        
      //récupération des paramètres passés et de l'url du referer
      String language = request.getParameter("lang");
      String referer = request.getHeader("referer");
      HttpSession session = request.getSession();
      ActionForward forward = null;
   
      // définition de la locale
      setLocale( request, new Locale( language ) );

      // redirection vers une page définie par défaut
      if( referer == null ) {
         forward = (mapping.findForward("success"));
      }
      // redirection vers l'url du referrer.
      else {
         forward = new RedirectingActionForward();
         forward.setPath( referer );
      }

      return forward;
   }
}