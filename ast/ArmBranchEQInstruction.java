package ast;

public class ArmBranchEQInstruction implements ArmInstruction {

   private final String label;

   public ArmBranchEQInstruction(String label) {
      this.label = label;
   }

   public String toString() {
      return "beq ." + label;
   } 

}
