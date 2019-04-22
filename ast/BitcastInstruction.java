package ast;

public class BitcastInstruction implements Instruction {

   private final RegisterValue result;
   private final Type ty;
   private final Value val;
   private final Type ty2;

   public BitcastInstruction(RegisterValue result, Type ty, 
                             Value val, Type ty2) {
      this.result = result;
      this.ty = ty;
      this.val = val;
      this.ty2 = ty2;
   }

   public String toString() {
      return String.format("%s = bitcast %s %s to %s",
                            result.toString(), ty.toString(),
                            val.toString(), ty2.toString());
   }

}
