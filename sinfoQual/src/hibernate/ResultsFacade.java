package hibernate;
import java.sql.Date;

import java.util.StringTokenizer;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *  @netbeans.hibernate.facade beanClass=hibernate.Results
 */
public class ResultsFacade {
    public void saveResults(Results results) {
        Session session = hibernate.HibernateUtil.currentSession();
        Transaction tx = session.beginTransaction();
        session.save(results);
        tx.commit();
        hibernate.HibernateUtil.closeSession();
    }
    
    public void generate(Date date, String producerName, String interestGroup, String organization, String typeCoffee, String batch, String perfum, String flavor, String body, String acidity, String residue, String perfumAdd, String flavorAdd, String bodyAdd, String acidityAdd, String residueAdd, String twelve, String thirteen, String fourteen, String fifteen, String sixteen, String seventeen, String eighteen, String nineteen, String twenty, String twentyOne, String humidity, String color, String smell, String uniformity, String denseness, String comment, String partiallyDamaged, String partiallyBlack, String cutIntoABatch, String cutIntoALittle, String green, String shortBitten, String offColor, String burned, String orangePeelSkin ,String averanado, String damageCausedByMushroom, String shells, String first, String second){
        Results temp = new Results();
        
        temp.setFirstTest(first);
        temp.setSecondTest(second);
        temp.setHumidity(humidity);
        temp.setAcidity(acidity);
        temp.setAcidityAdd(acidityAdd);
        temp.setAveranado(averanado);
        temp.setBatch(batch);
        temp.setBody(body);
        temp.setBodyAdd(bodyAdd);
        temp.setBurned(burned);
        temp.setColor(color);
        temp.setComment(comment);
        temp.setCutIntoABatch(cutIntoABatch);
        temp.setCutIntoALittle(cutIntoALittle);
        temp.setDamageCausedByMushroom(damageCausedByMushroom);
        temp.setDate(date);
        temp.setDenseness(denseness);
        temp.setEighteen(eighteen);
        temp.setFifteen(fifteen);
        temp.setFlavor(flavor);
        temp.setFlavorAdd(flavorAdd);
        temp.setFourteen(fourteen);
        temp.setGreen(green);
        temp.setHumidity(humidity);
        temp.setInterestGroup(interestGroup);
        temp.setNineteen(nineteen);
        temp.setOffColor(offColor);
        temp.setOrangePeelSkin(orangePeelSkin);
        temp.setOrganization(organization);
        temp.setPartiallyBlack(partiallyBlack);
        temp.setPartiallyDamaged(partiallyDamaged);
        temp.setPerfum(perfum);
        temp.setPerfumAdd(perfumAdd);
        temp.setProducerName(producerName);
        temp.setResidue(residue);
        temp.setResidueAdd(residueAdd);
        temp.setSeventeen(seventeen);
        temp.setShells(shells);
        temp.setShortBitten(shortBitten);
        temp.setSixteen(sixteen);
        temp.setSmell(smell);
        temp.setThirteen(thirteen);
        temp.setTwelve(twelve);
        temp.setTwenty(twenty);
        temp.setTwentyOne(twentyOne);
        temp.setTypeCoffee(typeCoffee);
        temp.setUniformity(uniformity);
        
        saveResults(temp);
    }
    
    public java.util.List findByCyp(int resultsId,java.sql.Date resultsDateB,java.sql.Date resultsDateE,java.lang.String resultsProducerName,java.lang.String resultsInterestGroup,java.lang.String resultsOrganization,java.lang.String resultsTypeCoffee,java.lang.String resultsBatch) {
        Session session = hibernate.HibernateUtil.currentSession();
        
        String queryTmp =
                " select results " +
                " from  " +
                " Results as results " +
                "  where  ";
        
        if (resultsId != 0) queryTmp = queryTmp.concat(" results.id = ? ");
        else queryTmp = queryTmp.concat(" results.id != ? ");
        
        queryTmp = queryTmp.concat(" and results.date >= ? ");
        queryTmp = queryTmp.concat(" and results.date <= ? ");
        
        if (resultsProducerName == "") {queryTmp = queryTmp.concat(" and results.producerName != ? ");resultsProducerName = "ssqqfdgsd";}
        else queryTmp = queryTmp.concat(" and results.producerName = ? ");
        
        if (resultsInterestGroup == "") {queryTmp = queryTmp.concat(" and results.interestGroup != ? ");resultsInterestGroup = "ssqqfdgsd";}
        else queryTmp = queryTmp.concat(" and results.interestGroup = ? ");
        if (resultsOrganization == ""){queryTmp = queryTmp.concat(" and results.organization != ? ");resultsOrganization = "ssqqfdgsd";}
        else queryTmp = queryTmp.concat(" and results.organization = ? ");
        if (resultsTypeCoffee == ""){queryTmp = queryTmp.concat(" and results.typeCoffee != ? ");resultsTypeCoffee = "ssqqfdgsd";}
        else queryTmp = queryTmp.concat(" and results.typeCoffee = ? ");
        if (resultsBatch == ""){queryTmp = queryTmp.concat(" and results.batch != ? ");resultsBatch = "ssqqfdgsd";}
        else queryTmp = queryTmp.concat(" and results.batch = ? ");
        
        
        org.hibernate.Query query = session.createQuery(queryTmp);
        
        query.setInteger(0,resultsId);
        query.setParameter(1,resultsDateB);
        query.setParameter(2,resultsDateE);
        query.setParameter(3,resultsProducerName);
        query.setParameter(4,resultsInterestGroup);
        query.setParameter(5,resultsOrganization);
        query.setParameter(6,resultsTypeCoffee);
        query.setParameter(7,resultsBatch);
        
        return query.list();
    }
}
