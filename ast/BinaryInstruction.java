package ast;

import java.util.ArrayList;
import java.util.List;

public class BinaryInstruction implements Instruction {

   private final RegisterValue result;
   private final String operator;
   private final Type ty;
   private Value op1;
   private Value op2;

   public BinaryInstruction(RegisterValue result, String operator,
                            Type ty, Value op1, Value op2) {
      this.result = result;
      this.operator = operator;
      this.ty = ty;
      this.op1 = op1;
      this.op2 = op2;
   }

   public String toString() {

      return String.format("%s = %s %s %s, %s",   
                           result.toString(), operator, 
                           ty.toString(), op1.toString(), 
                           op2.toString());
   }

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      if (op1 instanceof ImmediateValue) {
         ImmediateValue op1Val = (ImmediateValue)op1;
         if (op1Val.getVal() > 255) {
            RegisterValue t0 = new RegisterValue("t0", new IntType());
            UpperValue upper = new UpperValue(op1Val.getVal());
            LowerValue lower = new LowerValue(op1Val.getVal());
            armInstrucs.add(new ArmMoveInstruction(t0, lower, "w"));
            armInstrucs.add(new ArmMoveInstruction(t0, lower, "t"));
            op1 = t0;
         }
      }

      if (op2 instanceof ImmediateValue) {
         ImmediateValue op2Val = (ImmediateValue)op2;
         if (op2Val.getVal() > 255) {
            RegisterValue t1 = new RegisterValue("t1", new IntType());
            UpperValue upper = new UpperValue(op2Val.getVal());
            LowerValue lower = new LowerValue(op2Val.getVal());
            armInstrucs.add(new ArmMoveInstruction(t1, lower, "w"));
            armInstrucs.add(new ArmMoveInstruction(t1, lower, "t"));
            op2 = t1;
         }
      }
      
      if (operator.equals("sdiv")) {
         ArmRegister r0 = new ArmRegister(0);
         ArmRegister r1 = new ArmRegister(1);
         armInstrucs.add(new ArmMoveInstruction(r1, op2));
         armInstrucs.add(new ArmMoveInstruction(r0, op1));
         armInstrucs.add(new ArmBranchLInstruction("__aeabi_idiv"));
         System.out.println("NEW ARM MOVE from BIN INSTR");
         System.out.println("RESULT: " +result.toString());
         armInstrucs.add(new ArmMoveInstruction(result, r0));

      } else {
         armInstrucs.add(new ArmBinaryInstruction(result, operator, op1, op2));
      }

      return armInstrucs;
   }
}
