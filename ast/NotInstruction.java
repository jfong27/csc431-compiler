package ast;

import java.util.ArrayList;
import java.util.List;

public class NotInstruction implements Instruction {

   private final RegisterValue result;
   private final Value opnd;

   public NotInstruction(RegisterValue result, Value opnd) {
      this.result = result;
      this.opnd = opnd;
   }

   public String toString() {
      return String.format("%s = xor %s 1, %s",
                            result.toString(),
                            result.getType().toString(), opnd.toString());
   }

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      if (opnd instanceof ImmediateValue) {
         armInstrucs.add(new ArmMoveInstruction(result, opnd, "w"));
         armInstrucs.add(new ArmNotInstruction(result, result));
      } else {
         armInstrucs.add(new ArmNotInstruction(result, opnd));
      }

      return armInstrucs;

   }

}
