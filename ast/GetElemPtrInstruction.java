package ast;

import java.util.ArrayList;
import java.util.List;

public class GetElemPtrInstruction implements Instruction {

   private final RegisterValue result;
   private final Type type;
   private final Value ptrVal;
   private final Type fieldType;
   private final int index;

   public GetElemPtrInstruction(RegisterValue result, Type type,
                                Value ptrVal, Type fieldType,
                                int index) {
      this.result = result;
      this.type = type;
      this.ptrVal = ptrVal;
      this.fieldType = fieldType;
      this.index = index;
   }

   public String toString() {
      String resultString = String.format("%s = getelementptr %s %s, i1 0, i32 %d",
                                          result.toString(), type.toString(), 
                                          ptrVal.toString(), index);
      return resultString;
   }

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      if (index > 0) {
         ImmediateValue imm = new ImmediateValue(4 * index, new IntType());
         armInstrucs.add(new ArmAddInstruction(result, ptrVal, imm));
      } else {
         armInstrucs.add(new ArmMoveInstruction(result, ptrVal));
      }

      return armInstrucs;
   }
}
