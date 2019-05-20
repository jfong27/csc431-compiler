package ast;

import java.util.ArrayList;
import java.util.List;

public class CallInstruction implements Instruction {

   private final RegisterValue result;
   private final Type ty;
   private final String funName;
   private final List<Value> args;
   private final List<Declaration> params;
   
   public CallInstruction(RegisterValue result, Type ty, 
                          String funName, List<Value> args,
                          List<Declaration> params) {
      this.result = result;
      this.ty = ty;
      this.funName = funName;
      this.args = args;
      this.params = params;
   }

   public CallInstruction(Type ty, String funName, List<Value> args, List<Declaration> params) {
      this.result = null;
      this.ty = ty;
      this.funName = funName;
      this.args = args;
      this.params = params;
   }

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      ArmRegister r0 = new ArmRegister(0);
      RegisterValue r1 = new RegisterValue("r1", new IntType());

      armInstrucs.add(new ArmMoveWInstruction(r0, args.get(0)));
      armInstrucs.add(new ArmBranchLInstruction(funName));
      armInstrucs.add(new ArmMoveInstruction(result, r0));

      return armInstrucs;

   }

   public String toString() {
      StringBuilder sb = new StringBuilder();
      if (result == null) {
         sb.append("call ");
      } else {
         sb.append(result.toString());
         sb.append(" = call ");
      }
      sb.append(String.format("%s @%s(", ty.toString(), funName));
      for (int i = 0; i < args.size(); i++) {
         Value arg = args.get(i);
         if (arg.getType().toString().equals("null")) {
            sb.append(params.get(i).getType().toString());
            sb.append(arg.toString() + ", ");
         } else {
            sb.append(arg.getType().toString() + " ");
            sb.append(arg.toString() + ", ");
         }
      }
      //for (Value arg : args) {
      //   if (arg.getType().toString().equals("null")) {
      //      sb.append(arg.getType().toString() + " ");
      //      sb.append(arg.toString() + ", ");
      //   } else {
      //      sb.append(arg.getType().toString() + " ");
      //      sb.append(arg.toString() + ", ");
      //   }
      //}
      if (args.size() > 0) {
         sb.delete(sb.length() - 2, sb.length());
      }
      sb.append(")");

      return sb.toString();

   }
}


