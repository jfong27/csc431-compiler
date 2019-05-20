package ast;

public class ArmLoadRegisterInstruction implements ArmInstruction {

   private final Value target;
   private final Value source;

   public ArmLoadRegisterInstruction(Value target, Value source) {
      this.target = target;
      this.source = source;
   }


   public String toString() {
      return String.format("ldr %s, [%s]");
   }

}
