package ast;

import java.util.ArrayList;
import java.util.List;

public class BitcastInstruction implements Instruction {

   private final RegisterValue result;
   private final Type ty;
   private final Value val;
   private final Type ty2;

   public BitcastInstruction(RegisterValue result, Type ty, 
                             Value val, Type ty2) {
      this.result = result;
      this.ty = ty;
      this.val = val;
      this.ty2 = ty2;
   }

   public String toString() {
      return String.format("%s = bitcast %s %s to %s",
                            result.toString(), ty.toString(),
                            val.toString(), ty2.toString());
   }

   //Move r0 into val. Move val into result
   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      ArmRegister r0 = new ArmRegister(0);
      armInstrucs.add(new ArmMoveInstruction(result, val)); 


      return armInstrucs;
   }
}
