package ast;

public class ArmMoveWInstruction implements ArmInstruction {

   private final Value r;
   private final Value val;

   public ArmMoveWInstruction(Value r, Value val) {
      this.r = r;
      this.val = val;
   }

   public String toString() {
      return String.format("movw %s, %s", 
                           r.toString(), val.toStringArm());
   }
}
