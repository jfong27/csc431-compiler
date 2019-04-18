package ast;

public class BitcastInstruction implements Instruction {

   private final RegisterValue result;
   private final Value val;

   public BitcastInstruction(RegisterValue result, Value val) {
      this.result = result;
      this.val = val;
   }

   public String toString() {
      return String.format("%s = bitcast <ty> %s to <ty2>",
                            result.toString(), val.toString());
   }

}
