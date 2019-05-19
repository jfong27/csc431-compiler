package ast;

public class ArmBranchLInstruction implements ArmInstruction {
   private final String label;

   public ArmBranchLInstruction(String label) {
      this.label = label;
   }

   public String toString() {
      return "bl " + label;
   }
}
