/*
 * mailAction.java
 *
 * Created on 29 mai 2007, 17:37
 */

package mail.action;

import java.io.File;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mail.form.mailForm;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
/**
 *
 * @author bastien
 * @version
 */

public class mailAction extends Action {
    
    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    
    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    public ActionForward execute(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        mailForm formulaire = (mailForm)form;
        
        String from = formulaire.getFrom(), to = formulaire.getTo(), object = formulaire.getObject(), corps = formulaire.getCorps(), smtp = formulaire.getSmtp();
        String path = formulaire.getPath(), file = formulaire.getFile(), cc = formulaire.getCc();
        
        path = path.replaceAll("\\", "\\\\");
        
        // Nous devons passer les informations au serveur de messagerie sous
// forme de propriétés car JavaMail en comporte beaucoup...
        Properties props = new Properties();
        
// Votre réseau doit donner au serveur SMTP local le nom "nom_du_serveur_smtp"
        props.put("mail.smtp.host", smtp);
        
// Créer l’objet Session.
        Session session = Session.getDefaultInstance(props, null);
        
        try {
// Définit le message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));
            message.setSubject(object);
// Adresse CC.
            if (cc.length() != 0) {
                InternetAddress ccAddress = new InternetAddress(cc);
                message.addRecipient(Message.RecipientType.CC, ccAddress);
            }
            
// Première partie du message
            BodyPart messageBodyPart = new MimeBodyPart();
            
// Contenu du message
            messageBodyPart.setText(corps);
            
//Ajout de la première partie du message dans un objet Multipart
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);
            
            if (path.length() != 0) {
// Partie de la pièce jointe
                messageBodyPart = new MimeBodyPart();
                DataSource source = new FileDataSource(path);
                messageBodyPart.setDataHandler(new DataHandler(source));
                messageBodyPart.setFileName(file);
//Ajout de la partie pièce jointe
                multipart.addBodyPart(messageBodyPart);
            }
            message.setContent(multipart);
            
// Envoi du message
            Transport.send(message);
            
        } catch (MessagingException ex) {
            while ((ex = (MessagingException)ex.getNextException()) != null) {
                ex.printStackTrace();
            }
        }
        return mapping.findForward(SUCCESS);
    }
}
