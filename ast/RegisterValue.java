package ast;

public class RegisterValue implements Value {

   private final String name;
   private final Type type;

   public RegisterValue(String name, Type type) {
      this.name = name;
      this.type = type;
   }

   public String toString() {
      return "%" + name;
   }

   public Type getType() {
      return type;
   }

}
