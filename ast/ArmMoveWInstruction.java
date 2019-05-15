package ast;

public class ArmMoveWInstruction implements ArmInstruction {

   public ArmMoveWInstruction() {}

   public String toString() {
      return "movw r, #";
   }
}
