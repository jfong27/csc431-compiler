package ast;

public class ArmStoreInstruction implements ArmInstruction {

   private final Value target;
   private final Value source;

   public ArmStoreInstruction(Value target, Value source) {
      this.target = target;
      this.source = source;
   }

   public String toString() {

      return String.format("str %s, [%s]", 
                           target.toStringArm(),
                           source.toStringArm());
   }

}
