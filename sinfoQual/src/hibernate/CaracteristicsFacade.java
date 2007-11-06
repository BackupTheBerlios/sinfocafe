package hibernate;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *  @netbeans.hibernate.facade beanClass=hibernate.Caracteristics
 */
public class CaracteristicsFacade { 
    public void saveCaracteristics(Caracteristics caracteristics) {
        Session session = hibernate.HibernateUtil.currentSession();
        Transaction tx = session.beginTransaction();
        session.save(caracteristics);
        tx.commit();
        hibernate.HibernateUtil.closeSession();
    }    
    public java.util.List findCaracteristics() {
        Session session = hibernate.HibernateUtil.currentSession();
        org.hibernate.Query query = session.createQuery(
                " select caracteristics " +
                " from  " +
                " Caracteristics as caracteristics " +
                "  where  " +
                " caracteristics.id != null ");
        
        return query.list();
    }
}
