package ast;

import java.util.ArrayList;
import java.util.List;

public class ReturnInstruction implements Instruction {

   private final Type ty;
   private final Value val;

   public ReturnInstruction(Type ty, Value val) {
      this.ty = ty;
      this.val = val;
   }

   public String toString() {
      return String.format("ret %s %s",
                           ty.toString(), val.toString());
   }

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      RegisterValue returnReg = new RegisterValue("r0", new IntType());
      armInstrucs.add(new ArmMoveInstruction(returnReg, val));

      return armInstrucs;
   }
}
