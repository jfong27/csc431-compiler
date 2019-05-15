package ast;

public class ArmMoveInstruction implements ArmInstruction {

   private final RegisterValue result;
   private final Value source;

   public ArmMoveInstruction(RegisterValue result, Value source) {
      this.result = result;
      this.source = source;
   }

   public String toString() {
      return String.format("mov %s, %s",   
                           result.toString(),
                           source.toString()); 
   }
}
