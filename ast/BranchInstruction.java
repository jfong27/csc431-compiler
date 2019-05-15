package ast;

import java.util.ArrayList;
import java.util.List;

public class BranchInstruction implements Instruction {

   private final Value cond;
   private final String thenBlockLabel;
   private final String elseBlockLabel;

   public BranchInstruction(Value cond,
                            String thenBlockLabel,
                            String elseBlockLabel) {
      this.cond = cond;
      this.thenBlockLabel = thenBlockLabel;
      this.elseBlockLabel = elseBlockLabel;
   }

   public String toString() {
      return String.format("br i1 %s, label %%%s, label %%%s",
                           cond.toString(), thenBlockLabel,
                           elseBlockLabel);
   }

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      ImmediateValue t = new ImmediateValue(1, new IntType());
      armInstrucs.add(new ArmComparisonInstruction(cond, t));
      armInstrucs.add(new ArmBranchEQInstruction(thenBlockLabel));
      armInstrucs.add(new ArmBranchInstruction(elseBlockLabel));

      return armInstrucs;
      
   }

}
