package ast;

public class BinaryInstruction implements Instruction {

   private final RegisterValue result;
   private final String operator;
   private final Type ty;
   private final Value op1;
   private final Value op2;

   public BinaryInstruction(RegisterValue result, String operator,
                            Type ty, Value op1, Value op2) {
      this.result = result;
      this.operator = operator;
      this.ty = ty;
      this.op1 = op1;
      this.op2 = op2;
   }

   public String toString() {

      return String.format("%s = %s %s %s, %s",   
                           result.toString(), operator, 
                           ty.toString(), op1.toString(), 
                           op2.toString());
   }
}