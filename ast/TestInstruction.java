package ast;

import java.util.ArrayList;
import java.util.List;

public class TestInstruction implements Instruction {

   private final String label;

   public TestInstruction(String label) {
      this.label = label;
   }

   public String toString() {

      return "Test instruction: " + label;
   }

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();
      return armInstrucs;
   }
}
