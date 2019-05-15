package ast;

public class ArmNotInstruction implements ArmInstruction {

   private final RegisterValue result;
   private final Value opnd;

   public ArmNotInstruction(RegisterValue result, Value opnd) {
      this.result = result;
      this.opnd = opnd;
   }

   public String toString() {
      return "ARM NOT";
   }


}
