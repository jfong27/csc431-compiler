package ast;

public class ArmAddInstruction implements ArmInstruction {

   private final RegisterValue resultReg;
   private final Value reg1;
   private final Value reg2;

   public ArmAddInstruction(RegisterValue resultReg, 
                            Value reg1, Value reg2) {
      this.resultReg = resultReg;
      this.reg1 = reg1;
      this.reg2 = reg2;
   }

   public String toString() {
      return String.format("add %s, %s, %s", resultReg.toString(),
                            reg1.toString(), reg2.toString());
   }

}
