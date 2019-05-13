package ast;

public class ArmBinaryInstruction implements ArmInstruction {

   private final RegisterValue result;
   private final String operator;
   private final Value op1;
   private final Value op2;

   public ArmBinaryInstruction(RegisterValue result, String operator,
                            Value op1, Value op2) {
      this.result = result;
      this.operator = operator;
      this.op1 = op1;
      this.op2 = op2;
   }

   public String toString() {

      return String.format("%s %s, %s, %s",   
                           operator, result.toString(),
                           op1.toString(), 
                           op2.toString());
   }
}
