package ast;

import java.util.Objects;

public class ArmRegister implements Value {

   private final int reg;
   private final String name;

   public ArmRegister(int reg) {
      this.reg = reg;
      this.name = null;
   }

   public ArmRegister(String name) {
      this.reg = 0;
      this.name = name;
   }

   public String toString() {
      if (name != null) {
         return name;
      } 
      return "r" + Integer.toString(reg);
   }

   public String toStringArm() {
      return toString();
   }

   public Type getType() {
      return new IntType();
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
