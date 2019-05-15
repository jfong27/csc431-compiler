package ast;

public class ArmMoveGTInstruction implements ArmInstruction {

   private final RegisterValue result;
   private final Value source;

   public ArmMoveGTInstruction(RegisterValue result, Value source) {
      this.result = result;
      this.source = source;
   }

   public String toString() {
      return String.format("movgt %s, %s",   
                           result.toString(),
                           source.toString()); 
   }
}
