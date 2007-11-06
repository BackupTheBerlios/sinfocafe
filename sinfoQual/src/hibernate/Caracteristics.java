
package hibernate ;
/**
 * 
 *
 * @hibernate.class
 *     table="CARACTERISTICS"
 *
 */
public class Caracteristics {
 
    
  // <editor-fold defaultstate="collapsed" desc=" Property:   String typeOfCoffee ">
    private String typeOfCoffee;
    /**
     *   @hibernate.property
     */
    public String getTypeOfCoffee() {
        return typeOfCoffee;
    }
    public void setTypeOfCoffee(String typeOfCoffee) {
        this.typeOfCoffee = typeOfCoffee;
    }
    // </editor-fold>

  // <editor-fold defaultstate="collapsed" desc=" Property:   String organization ">
  private String organization;
/**
  *   @hibernate.property
  */
   public String getOrganization () {
      return organization;
   } 
   public void setOrganization (String organization) {
      this.organization = organization;
   }
   // </editor-fold>

  // <editor-fold defaultstate="collapsed" desc=" PrimaryKey:   int id ">
   private int id;
/**
  *   @hibernate.id
  *     generator-class="increment"
  *     column="id"
  *     type="int"
  *   @hibernate.column
  *     name="id"
  *     not-null="true"
  */
   public int getId () {
      return id;
   } 
   public void setId (int id) {
      this.id = id;
   }
   //</editor-fold>
}