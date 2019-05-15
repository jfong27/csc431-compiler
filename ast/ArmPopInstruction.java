package ast;

public class ArmPopInstruction implements ArmInstruction {

   public ArmPopInstruction() {
   }

   public String toString() {
      return "pop {fp, pc}";
   }

}
