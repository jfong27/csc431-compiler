package ast;

public class UnconditionalBranchInstruction implements Instruction {

   private final String blockLabel;

   public UnconditionalBranchInstruction(String blockLabel) {
      this.blockLabel = blockLabel;
   }

   public String toString() {
      return "br label %" + blockLabel;
   }
}
