package ast;

public class RegisterValue implements Value {

   private final String name;

   public RegisterValue(String name) {
      this.name = name;
   }

   public String toString() {
      return "%" + name;
   }

}
