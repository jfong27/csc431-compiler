package ast;

import java.util.Objects;

public class RegisterValue implements Value {

   private final String name;
   private final Type type;

   public RegisterValue(String name, Type type) {
      this.name = name;
      this.type = type;
   }

   public RegisterValue(Type type) {
      this.name = "u" + Integer.toString(Counter.getCount());
      this.type = type;
   }

   public String toString() {
      return "%" + name;
   }

   public String toStringArm() {
      return "%" + name;
   }

   public String getName() {
      return name;
   }

   public Type getType() {
      return type;
   }

   @Override
   public boolean equals(Object o) {
      if (o == this) { return true; }
      if (!(o instanceof Value)) {
         return false;
      }
      return ((Value)o).toStringArm().equals(toStringArm());
   }

   @Override
   public int hashCode() {
      return Objects.hash(toStringArm());
   }

}
