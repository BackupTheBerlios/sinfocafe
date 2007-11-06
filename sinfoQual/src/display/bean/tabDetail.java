package display.bean;

import java.util.ArrayList;

public class tabDetail implements java.io.Serializable {
    
    private String humidity = null;
    private String color = null;  
    private String smell = null;
    private String uniformity = null;
    private String denseness = null;
    private String comment = null;
    private String testNum = null;
    private String bigGrain = null;
    private String mediumGrain = null;
    private String smallGrain = null;
    private String firstGrain = null;
    private String secondGrain = null;
    private String thirdGrain = null;
    private String flawMark = null;
    private String tastingMark = null;
    private String firstTest = null;
    private String secondTest = null;

    
    public String getFirstTest() {return firstTest;}
    public void setFirstTest(String var) {firstTest=var;}
    
    public String getSecondTest() {return secondTest;}
    public void setSecondTest(String var) {secondTest=var;}
        
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
    
    public String getTestNum() {return testNum;}
    public void setTestNum (String var) {testNum = var;}
    
    public String getBigGrain() {return bigGrain;}
    public void setBigGrain (String var) {bigGrain = var;}
    
    public String getMediumGrain() {return mediumGrain;}
    public void setMediumGrain (String var) {mediumGrain = var;}
    
    public String getSmallGrain() {return smallGrain;}
    public void setSmallGrain (String var) {smallGrain = var;}
    
    public String getFirstGrain() {return firstGrain;}
    public void setFirstGrain (String var) {firstGrain = var;}
    
    public String getSecondGrain() {return secondGrain;}
    public void setSecondGrain (String var) {secondGrain = var;}
    
    public String getThirdGrain() {return thirdGrain;}
    public void setThirdGrain (String var) {thirdGrain = var;}
    
    public String getFlawMark() {return flawMark;}
    public void setFlawMark (String var) {flawMark = var;}
    
    public String getTastingMark() {return tastingMark;}
    public void setTastingMark (String var) {tastingMark = var;}
}