package ast;

import java.util.ArrayList;
import java.util.List;

public class UnconditionalBranchInstruction implements Instruction {

   private final String blockLabel;

   public UnconditionalBranchInstruction(String blockLabel) {
      this.blockLabel = blockLabel;
   }

   public String toString() {
      return "br label %" + blockLabel;
   }

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      armInstrucs.add(new ArmUnconditionalBranchInstruction(blockLabel));

      return armInstrucs;
   }

}
