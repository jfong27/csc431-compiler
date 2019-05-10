package ast;

public class ArmUnconditionalBranchInstruction implements Instruction {

   private final String blockLabel;

   public ArmUnconditionalBranchInstruction(String blockLabel) {
      this.blockLabel = blockLabel;
   }

   public String toString() {
      return "br " + blockLabel + "\n";
   }
}
