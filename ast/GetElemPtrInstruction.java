package ast;

import java.util.ArrayList;
import java.util.List;

public class GetElemPtrInstruction implements Instruction {

   private final Value target;
   private final Type type;
   private final Value ptrVal;
   private final Type fieldType;
   private final int index;

   public GetElemPtrInstruction(Value target, Type type,
                                Value ptrVal, Type fieldType,
                                int index) {
      this.target = target;
      this.type = type;
      this.ptrVal = ptrVal;
      this.fieldType = fieldType;
      this.index = index;
   }

   public String toString() {
      String resultString = String.format("%s = getelementptr %s %s, i1 0, i32 %d",
                                          target.toString(), type.toString(), 
                                          ptrVal.toString(), index);
      return resultString;
   }

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      if (index > 0) {
         ImmediateValue imm = new ImmediateValue(4 * index, new IntType());
         armInstrucs.add(new ArmBinaryInstruction(target, "add", ptrVal, imm));
      } else {
         armInstrucs.add(new ArmMoveInstruction(target, ptrVal));
      }

      return armInstrucs;
   }
}
