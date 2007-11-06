package hibernate ;
import java.sql.Date;

/**
 * 
 *
 * @hibernate.class
 *     table="RESULTS"
 *
 */
public class Results {

   // <editor-fold defaultstate="collapsed" desc=" PrimaryKey:   int id ">
   private int id;
/**
  *   @hibernate.id
  *     generator-class="increment"
  *     column="id"
  *     type="int"
  *   @hibernate.column
  *     name="id"
  *     not-null="false"
  */
   public int getId () {
      return id;
   } 
   public void setId (int id) {
      this.id = id;
   }
   //</editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   Date date ">
   private Date date;
   /**
    *   @hibernate.property
    */
   public Date getDate() {
       return date;
   }
   public void setDate(Date date) {
       this.date = date;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String producerName ">
   private String producerName;
   /**
    *   @hibernate.property
    */
   public String getProducerName() {
       return producerName;
   }
   public void setProducerName(String producerName) {
       this.producerName = producerName;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String interestGroup ">
   private String interestGroup;
   /**
    *   @hibernate.property
    */
   public String getInterestGroup() {
       return interestGroup;
   }
   public void setInterestGroup(String interestGroup) {
       this.interestGroup = interestGroup;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String organization ">
   private String organization;
   /**
    *   @hibernate.property
    */
   public String getOrganization() {
       return organization;
   }
   public void setOrganization(String organization) {
       this.organization = organization;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String typeCoffee ">
   private String typeCoffee;
   /**
    *   @hibernate.property
    */
   public String getTypeCoffee() {
       return typeCoffee;
   }
   public void setTypeCoffee(String typeCoffee) {
       this.typeCoffee = typeCoffee;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String batch ">
   private String batch;
   /**
    *   @hibernate.property
    */
   public String getBatch() {
       return batch;
   }
   public void setBatch(String batch) {
       this.batch = batch;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String humidity ">
   private String humidity;
   /**
    *   @hibernate.property
    */
   public String getHumidity() {
       return humidity;
   }
   public void setHumidity(String humidity) {
       this.humidity = humidity;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String color ">
   private String color;
   /**
    *   @hibernate.property
    */
   public String getColor() {
       return color;
   }
   public void setColor(String color) {
       this.color = color;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String smell ">
   private String smell;
   /**
    *   @hibernate.property
    */
   public String getSmell() {
       return smell;
   }
   public void setSmell(String smell) {
       this.smell = smell;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String denseness ">
   private String denseness;
   /**
    *   @hibernate.property
    */
   public String getDenseness() {
       return denseness;
   }
   public void setDenseness(String denseness) {
       this.denseness = denseness;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String uniformity ">
   private String uniformity;
   /**
    *   @hibernate.property
    */
   public String getUniformity() {
       return uniformity;
   }
   public void setUniformity(String uniformity) {
       this.uniformity = uniformity;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String comment ">
   private String comment;
   /**
    *   @hibernate.property
    */
   public String getComment() {
       return comment;
   }
   public void setComment(String comment) {
       this.comment = comment;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String twelve ">
   private String twelve;
   /**
    *   @hibernate.property
    */
   public String getTwelve() {
       return twelve;
   }
   public void setTwelve(String twelve) {
       this.twelve = twelve;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String thirteen ">
   private String thirteen;
   /**
    *   @hibernate.property
    */
   public String getThirteen() {
       return thirteen;
   }
   public void setThirteen(String thirteen) {
       this.thirteen = thirteen;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String fourteen ">
   private String fourteen;
   /**
    *   @hibernate.property
    */
   public String getFourteen() {
       return fourteen;
   }
   public void setFourteen(String fourteen) {
       this.fourteen = fourteen;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String fifteen ">
   private String fifteen;
   /**
    *   @hibernate.property
    */
   public String getFifteen() {
       return fifteen;
   }
   public void setFifteen(String fifteen) {
       this.fifteen = fifteen;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String sixteen ">
   private String sixteen;
   /**
    *   @hibernate.property
    */
   public String getSixteen() {
       return sixteen;
   }
   public void setSixteen(String sixteen) {
       this.sixteen = sixteen;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String seventeen ">
   private String seventeen;
   /**
    *   @hibernate.property
    */
   public String getSeventeen() {
       return seventeen;
   }
   public void setSeventeen(String seventeen) {
       this.seventeen = seventeen;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String eighteen ">
   private String eighteen;
   /**
    *   @hibernate.property
    */
   public String getEighteen() {
       return eighteen;
   }
   public void setEighteen(String eighteen) {
       this.eighteen = eighteen;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String nineteen ">
   private String nineteen;
   /**
    *   @hibernate.property
    */
   public String getNineteen() {
       return nineteen;
   }
   public void setNineteen(String nineteen) {
       this.nineteen = nineteen;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String twenty ">
   private String twenty;
   /**
    *   @hibernate.property
    */
   public String getTwenty() {
       return twenty;
   }
   public void setTwenty(String twenty) {
       this.twenty = twenty;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String twentyOne ">
   private String twentyOne;
   /**
    *   @hibernate.property
    */
   public String getTwentyOne() {
       return twentyOne;
   }
   public void setTwentyOne(String twentyOne) {
       this.twentyOne = twentyOne;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String partiallyDamaged ">
   private String partiallyDamaged;
   /**
    *   @hibernate.property
    */
   public String getPartiallyDamaged() {
       return partiallyDamaged;
   }
   public void setPartiallyDamaged(String partiallyDamaged) {
       this.partiallyDamaged = partiallyDamaged;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String partiallyBlack ">
   private String partiallyBlack;
   /**
    *   @hibernate.property
    */
   public String getPartiallyBlack() {
       return partiallyBlack;
   }
   public void setPartiallyBlack(String partiallyBlack) {
       this.partiallyBlack = partiallyBlack;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String cutIntoABatch ">
   private String cutIntoABatch;
   /**
    *   @hibernate.property
    */
   public String getCutIntoABatch() {
       return cutIntoABatch;
   }
   public void setCutIntoABatch(String cutIntoABatch) {
       this.cutIntoABatch = cutIntoABatch;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String cutIntoALittle ">
   private String cutIntoALittle;
   /**
    *   @hibernate.property
    */
   public String getCutIntoALittle() {
       return cutIntoALittle;
   }
   public void setCutIntoALittle(String cutIntoALittle) {
       this.cutIntoALittle = cutIntoALittle;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String green ">
   private String green;
   /**
    *   @hibernate.property
    */
   public String getGreen() {
       return green;
   }
   public void setGreen(String green) {
       this.green = green;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String shortBitten ">
   private String shortBitten;
   /**
    *   @hibernate.property
    */
   public String getShortBitten() {
       return shortBitten;
   }
   public void setShortBitten(String shortBitten) {
       this.shortBitten = shortBitten;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String offColor ">
   private String offColor;
   /**
    *   @hibernate.property
    */
   public String getOffColor() {
       return offColor;
   }
   public void setOffColor(String offColor) {
       this.offColor = offColor;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String burned ">
   private String burned;
   /**
    *   @hibernate.property
    */
   public String getBurned() {
       return burned;
   }
   public void setBurned(String burned) {
       this.burned = burned;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String orangePeelSkin ">
   private String orangePeelSkin;
   /**
    *   @hibernate.property
    */
   public String getOrangePeelSkin() {
       return orangePeelSkin;
   }
   public void setOrangePeelSkin(String orangePeelSkin) {
       this.orangePeelSkin = orangePeelSkin;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String averanado ">
   private String averanado;
   /**
    *   @hibernate.property
    */
   public String getAveranado() {
       return averanado;
   }
   public void setAveranado(String averanado) {
       this.averanado = averanado;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String damageCausedByMushroom ">
   private String damageCausedByMushroom;
   /**
    *   @hibernate.property
    */
   public String getDamageCausedByMushroom() {
       return damageCausedByMushroom;
   }
   public void setDamageCausedByMushroom(String damageCausedByMushroom) {
       this.damageCausedByMushroom = damageCausedByMushroom;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String shells ">
   private String shells;
   /**
    *   @hibernate.property
    */
   public String getShells() {
       return shells;
   }
   public void setShells(String shells) {
       this.shells = shells;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String perfum ">
   private String perfum;
   /**
    *   @hibernate.property
    */
   public String getPerfum() {
       return perfum;
   }
   public void setPerfum(String perfum) {
       this.perfum = perfum;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String perfumAdd ">
   private String perfumAdd;
   /**
    *   @hibernate.property
    */
   public String getPerfumAdd() {
       return perfumAdd;
   }
   public void setPerfumAdd(String perfumAdd) {
       this.perfumAdd = perfumAdd;
   }
   // </editor-fold>

   // <editor-fold defaultstate="collapsed" desc=" Property:   String flavor ">
   private String flavor;
   /**
    *   @hibernate.property
    */
   public String getFlavor() {
       return flavor;
   }
   public void setFlavor(String flavor) {
       this.flavor = flavor;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String flavorAdd ">
   private String flavorAdd;
   /**
    *   @hibernate.property
    */
   public String getFlavorAdd() {
       return flavorAdd;
   }
   public void setFlavorAdd(String flavorAdd) {
       this.flavorAdd = flavorAdd;
   }
   // </editor-fold>

   // <editor-fold defaultstate="collapsed" desc=" Property:   String body ">
   private String body;
   /**
    *   @hibernate.property
    */
   public String getBody() {
       return body;
   }
   public void setBody(String body) {
       this.body = body;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String bodyAdd ">
   private String bodyAdd;
   /**
    *   @hibernate.property
    */
   public String getBodyAdd() {
       return bodyAdd;
   }
   public void setBodyAdd(String bodyAdd) {
       this.bodyAdd = bodyAdd;
   }
   // </editor-fold>

   // <editor-fold defaultstate="collapsed" desc=" Property:   String acidity ">
   private String acidity;
   /**
    *   @hibernate.property
    */
   public String getAcidity() {
       return acidity;
   }
   public void setAcidity(String acidity) {
       this.acidity = acidity;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String acidityAdd ">
   private String acidityAdd;
   /**
    *   @hibernate.property
    */
   public String getAcidityAdd() {
       return acidityAdd;
   }
   public void setAcidityAdd(String acidityAdd) {
       this.acidityAdd = acidityAdd;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String residue ">
   private String residue;
   /**
    *   @hibernate.property
    */
   public String getResidue() {
       return residue;
   }
   public void setResidue(String residue) {
       this.residue = residue;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String residueAdd ">
   private String residueAdd;
   /**
    *   @hibernate.property
    */
   public String getResidueAdd() {
       return residueAdd;
   }
   public void setResidueAdd(String residueAdd) {
       this.residueAdd = residueAdd;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String FirstTest ">
   private String FirstTest;
   /**
    *   @hibernate.property
    */
   public String getFirstTest() {
       return FirstTest;
   }
   public void setFirstTest(String FirstTest) {
       this.FirstTest = FirstTest;
   }
   // </editor-fold>
   
   // <editor-fold defaultstate="collapsed" desc=" Property:   String secondTest ">
   private String secondTest;
   /**
    *   @hibernate.property
    */
   public String getSecondTest() {
       return secondTest;
   }
   public void setSecondTest(String secondTest) {
       this.secondTest = secondTest;
   }
   // </editor-fold>

}