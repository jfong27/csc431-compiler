package ast;

import java.util.ArrayList;
import java.util.List;

public class ComparisonInstruction implements Instruction {

   private final RegisterValue result;
   private final String cond;
   private final Type ty;
   private final Value op1;
   private final Value op2;

   public ComparisonInstruction(RegisterValue result, String cond,
                            Type ty, Value op1, Value op2) {
      this.result = result;
      this.cond = cond;
      this.ty = ty;
      this.op1 = op1;
      this.op2 = op2;
   }

   public String toString() {

      return String.format("%s = icmp %s %s %s, %s",
                           result.toString(), cond, 
                           ty.toString(), op1.toString(), 
                           op2.toString());
   }

   //Move 0 into target reg, 
   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      ImmediateValue zero = new ImmediateValue(0, new IntType());
      ImmediateValue one = new ImmediateValue(1, new IntType());

      if (op1 instanceof ImmediateValue &&
          op2 instanceof ImmediateValue) {
         armInstrucs.add(new ArmMoveInstruction(result, op1, "w"));
         armInstrucs.add(new ArmComparisonInstruction(result, op2));
         armInstrucs.add(new ArmMoveInstruction(result, zero));
         armInstrucs.add(new ArmMoveInstruction(result, one, cond));
         armInstrucs.add(new ArmComparisonInstruction(result, one));
      } else {
         armInstrucs.add(new ArmMoveInstruction(result, zero));
         armInstrucs.add(new ArmComparisonInstruction(op1, op2));
         armInstrucs.add(new ArmMoveInstruction(result, one, cond));
         armInstrucs.add(new ArmComparisonInstruction(result, one));
      }

      return armInstrucs;

   }
}
