/*
 * accessBean.java
 *
 * Created on 7 avril 2007, 13:13
 */

package access.bean;

/**
 * @author alex and Bastien
 */
public class accessBean implements java.io.Serializable {
    
    private String date = null;
    private String product = null;
    private String producerName = null;
    private String interestGroup = null;
    private String organization = null;
    private String typeCoffee = null;
    private String batch = null;
    private String perfum = null;
    private String flavor = null;	
    private String body = null;		
    private String acidity = null;
    private String residue = null;
    private String perfumAdd = null;
    private String flavorAdd = null;	
    private String bodyAdd = null;		
    private String acidityAdd = null;
    private String residueAdd = null;
    private String twelve = null;
    private String thirteen = null;  
    private String fourteen = null;
    private String fifteen = null;
    private String sixteen = null;
    private String seventeen = null;
    private String eighteen = null;
    private String nineteen = null;
    private String twenty = null;
    private String twentyOne = null;
    private String humidity = null;
    private String color = null;  
    private String smell = null;
    private String uniformity = null;
    private String denseness = null;
    private String comment = null;
    private String partiallyDamaged = null;
    private String partiallyBlack = null;
    private String cutIntoABatch = null;
    private String cutIntoALittle = null; 
    private String green = null;
    private String shortBitten = null;
    private String offColor = null;
    private String burned = null;
    private String orangePeelSkin = null;
    private String averanado = null; 
    private String damageCausedByMushroom = null;
    private String shells = null;
    private boolean greenCoffee = false;
    private boolean size = false;
    private boolean flaw = false;
    private boolean tasting = false;
    private String firstTest = null;
    private String secondTest = null;

    
    public String getFirstTest() {return firstTest;}
    public void setFirstTest(String var) {firstTest=var;}
    
    public String getSecondTest() {return secondTest;}
    public void setSecondTest(String var) {secondTest=var;}
    
    public boolean getGreenCoffee() {return greenCoffee;}
    public void setGreenCoffee (boolean var) {greenCoffee = var;}
    
    public boolean getSize() {return size;}
    public void setSize (boolean var) {size = var;}
    
    public boolean getFlaw() {return flaw;}
    public void setFlaw (boolean var) {flaw = var;}
    
    public boolean getTasting() {return tasting;}
    public void setTasting (boolean var) {tasting = var;}
    
    public String getDate() {return date;}
    public void setDate (String var) {date = var;}
    
    public String getPartiallyDamaged() {return partiallyDamaged;}
    public void setPartiallyDamaged(String var) {partiallyDamaged=var;}
 
    public String getPartiallyBlack() {return partiallyBlack;}
    public void setPartiallyBlack(String var) {partiallyBlack=var;}
 
    public String getCutIntoABatch() {return cutIntoABatch;}
    public void setCutIntoABatch(String var) {cutIntoABatch=var;}
 
    public String getCutIntoALittle() {return cutIntoALittle;}
    public void setCutIntoALittle(String var) {cutIntoALittle=var;}
 
    public String getGreen() {return green;}
    public void setGreen(String var) {green=var;}
 
    public String getShortBitten() {return shortBitten;}
    public void setShortBitten(String var) {shortBitten=var;}
 
    public String getOffColor() {return offColor;}
    public void setOffColor(String var) {offColor=var;}
 
    public String getBurned() {return burned;}
    public void setBurned(String var) {burned=var;}
 
    public String getOrangePeelSkin() {return orangePeelSkin;}
    public void setOrangePeelSkin(String var) {orangePeelSkin=var;}
 
    public String getAveranado() {return averanado;}
    public void setAveranado(String var) {averanado=var;}
 
    public String getDamageCausedByMushroom() {return damageCausedByMushroom;}
    public void setDamageCausedByMushroom(String var) {damageCausedByMushroom=var;}
 
    public String getShells() {return shells;}
    public void setShells(String var) {shells=var;}
    
    public String getHumidity() {return humidity;}
    public void setHumidity(String var) {humidity=var;}

    public String getColor() {return color;}
    public void setColor(String var) {color=var;}

    public String getSmell() {return smell;}
    public void setSmell(String var) {smell=var;}
    
    public String getDenseness() {return denseness;}
    public void setDenseness(String var) {denseness=var;}
    
    public String getUniformity() {return uniformity;}
    public void setUniformity(String var) {uniformity=var;}
    
    public String getComment() {return comment;}
    public void setComment (String var) {comment = var;}
    
    public String getTwelve() {return twelve;}
    public void setTwelve(String var) {twelve=var;}

    public String getThirteen() {return thirteen;}
    public void setThirteen(String var) {thirteen=var;}

    public String getFourteen() {return fourteen;}
    public void setFourteen(String var) {fourteen=var;}
    
    public String getFifteen() {return fifteen;}
    public void setFifteen(String var) {fifteen=var;}
    
    public String getSixteen() {return sixteen;}
    public void setSixteen(String var) {sixteen=var;}
    
    public String getSeventeen() {return seventeen;}
    public void setSeventeen (String var) {seventeen = var;}
    
    public String getEighteen() {return eighteen;}
    public void setEighteen (String var) {eighteen = var;}
    
    public String getNineteen() {return nineteen;}
    public void setNineteen (String var) {nineteen = var;}
    
    public String getTwenty() {return twenty;}
    public void setTwenty (String var) {twenty = var;}
    
    public String getTwentyOne() {return twentyOne;}
    public void setTwentyOne (String var) {twentyOne = var;}  
    
    public void setPerfum (String var) {perfum = var;}
    public String getPerfum () {return perfum;}
    
    public void setFlavor (String var) {flavor = var;}
    public String getFlavor () {return flavor;}
    
    public void setBody (String var) {body = var;}
    public String getBody () {return body;}
    
    public void setAcidity (String var) {acidity = var;}
    public String getAcidity () {return acidity;}
    
    public void setResidue (String var) {residue = var;}
    public String getResidue () {return residue;}
    
    public void setPerfumAdd (String var) {perfumAdd = var;}
    public String getPerfumAdd () {return perfumAdd;}
    
    public void setFlavorAdd (String var) {flavorAdd = var;}
    public String getFlavorAdd () {return flavorAdd;}
    
    public void setBodyAdd (String var) {bodyAdd = var;}
    public String getBodyAdd () {return bodyAdd;}
    
    public void setAcidityAdd (String var) {acidityAdd = var;}
    public String getAcidityAdd () {return acidityAdd;}
    
    public void setResidueAdd (String var) {residueAdd = var;}
    public String getResidueAdd () {return residueAdd;}
    
    public void setProduct(String var){product = var;}
    public String getProduct(){return product;}

    public String getProducerName() {return producerName;}
    public void setProducerName(String string) {producerName = string;}
    
    public String getInterestGroup() {return interestGroup;}
    public void setInterestGroup(String string) {interestGroup = string;}
    
    public String getOrganization() {return organization;}
    public void setOrganization(String string) {organization = string;}
    
    public String getTypeCoffee() {return typeCoffee;}
    public void setTypeCoffee(String string) {typeCoffee = string;}
    
    public String getBatch() {return batch;}
    public void setBatch(String string) {batch = string;}
}


