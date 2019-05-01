package ast;

public class NotInstruction implements Instruction {

   private final RegisterValue result;
   private final Value opnd;

   public NotInstruction(RegisterValue result, Value opnd) {
      this.result = result;
      this.opnd = opnd;
   }

   public String toString() {
      return String.format("%s = xor %s 1, %s",
                            result.toString(),
                            result.getType().toString(), opnd.toString());
   }

}
