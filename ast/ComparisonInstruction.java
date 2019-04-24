package ast;

public class ComparisonInstruction implements Instruction {

   private final RegisterValue result;
   private final String cond;
   private final Type ty;
   private final Value op1;
   private final Value op2;

   public ComparisonInstruction(RegisterValue result, String cond,
                            Type ty, Value op1, Value op2) {
      this.result = result;
      this.cond = cond;
      this.ty = ty;
      this.op1 = op1;
      this.op2 = op2;
   }

   public String toString() {

      return String.format("%s = icmp %s %s %s, %s",
                           result.toString(), cond, 
                           ty.toString(), op1.toString(), 
                           op2.toString());
   }
}
