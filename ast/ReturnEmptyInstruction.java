package ast;

import java.util.ArrayList;
import java.util.List;

public class ReturnEmptyInstruction implements Instruction {

   public ReturnEmptyInstruction() {
   }

   public String toString() {
      return "ret void";
   }

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      armInstrucs.add(new ArmPopInstruction());

      return armInstrucs;
   }
}
