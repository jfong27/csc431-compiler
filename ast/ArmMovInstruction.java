package ast;

public class ArmMovInstruction implements Instruction {

   private final RegisterValue result;
   private final RegisterValue source;

   public ArmMovInstruction(RegisterValue result, RegisterValue source) {
      this.result = result;
      this.source = source;
   }

   public String toString() {

      return String.format("mov %s, %s",   
                           result.toString(),
                           source.toString()); 
   }
}
