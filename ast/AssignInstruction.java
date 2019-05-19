package ast;

import java.util.ArrayList;
import java.util.List;

public class AssignInstruction implements Instruction {

   public AssignInstruction() {
   }

   public String toString() {
      return "Assign instruction" + Integer.toString(Counter.getCount());
   }

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      return armInstrucs;
   }

}
