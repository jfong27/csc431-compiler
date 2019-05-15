package ast;

public class ArmBranchInstruction implements ArmInstruction {

   private final String label;

   public ArmBranchInstruction(String label) {
      this.label = label;
   }

   public String toString() {
      return "b ." + label;
   } 

}
