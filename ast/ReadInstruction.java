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

      ArmRegister r0 = new ArmRegister(0);
      ImmediateValue zero = new ImmediateValue(0, new IntType());
      armInstrucs.add(new ArmMoveWInstruction(r0, zero));
      return armInstrucs;
   }
}
