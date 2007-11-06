
package hibernate ;

/**
 * 
 *
 * @hibernate.class
 *     table="PRODUCER"
 *
 */
public class Producer {
 
  // <editor-fold defaultstate="collapsed" desc=" Property:   String firstname ">
  private String firstname;
/**
  *   @hibernate.property
  */
   public String getFirstname () {
      return firstname;
   } 
   public void setFirstname (String firstname) {
      this.firstname = firstname;
   }
   // </editor-fold>
 
  // <editor-fold defaultstate="collapsed" desc=" Property:   String interest_group ">
  private String interest_group;
/**
  *   @hibernate.property
  */
   public String getInterest_group () {
      return interest_group;
   } 
   public void setInterest_group (String interest_group) {
      this.interest_group = interest_group;
   }
   // </editor-fold>
 
  // <editor-fold defaultstate="collapsed" desc=" Property:   String name ">
  private String name;
/**
  *   @hibernate.property
  */
   public String getName () {
      return name;
   } 
   public void setName (String name) {
      this.name = name;
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