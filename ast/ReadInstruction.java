package ast;

import java.util.ArrayList;
import java.util.List;

public class ReadInstruction implements Instruction {

   private final RegisterValue result;

   public ReadInstruction(RegisterValue result) {
      this.result = result;
   }

   public String toString() {
      return String.format("%s = call i32 @read()", result.toString());
   }

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      armInstrucs.add(new ArmMoveWInstruction());
      return armInstrucs;
   }
}
