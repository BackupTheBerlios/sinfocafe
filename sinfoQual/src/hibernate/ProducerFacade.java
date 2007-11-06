package hibernate;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *  @netbeans.hibernate.facade beanClass=hibernate.Producer
 */
public class ProducerFacade { 
    public void saveProducer(Producer producer) {
        Session session = hibernate.HibernateUtil.currentSession();
        Transaction tx = session.beginTransaction();
        session.save(producer);
        tx.commit();
        hibernate.HibernateUtil.closeSession();
    }    
    
    public void generate(){
        Producer temp = new Producer();
        temp.setName("coco");     
        saveProducer(temp);
        
        temp = new Producer();
        temp.setName("cyplecosto");     
        saveProducer(temp);
    }
    
    public java.util.List findByIdSup(int producerId) {
        Session session = hibernate.HibernateUtil.currentSession();
        org.hibernate.Query query = session.createQuery(
                " select producer " +
                " from  " +
                " Producer as producer " +
                "  where  " +
                " producer.id >= ? ");
        query.setInteger(0,producerId);
        
        return query.list();
    }

}
