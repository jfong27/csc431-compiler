package ast;

public class ArmRegister implements Value {

   private final int reg;

   public ArmRegister(int reg) {
      this.reg = reg;
   }

   public String toString() {
      return "r" + Integer.toString(reg);
   }

   public String toStringArm() {
      return toString();
   }

   public Type getType() {
      return new IntType();
   }

}
