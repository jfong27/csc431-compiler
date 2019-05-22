package ast;

public class ArmLoadInstruction implements ArmInstruction {

   private final Value target;
   private final Value source;

   public ArmLoadInstruction(Value target, Value source) {
      this.target = target;
      this.source = source;
   }

   public String toString() {

      return String.format("ldr %s, [%s]", 
                           target.toStringArm(),
                           source.toStringArm());
   }

}

