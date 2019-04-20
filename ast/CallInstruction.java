package ast;

import java.util.List;

public class CallInstruction implements Instruction {

   private final RegisterValue result;
   private final Type ty;
   private final String funName;
   private final List<Value> args;
   
   public CallInstruction(RegisterValue result, Type ty, 
                          String funName, List<Value> args) {
      this.result = result;
      this.ty = ty;
      this.funName = funName;
      this.args = args;
   }

   public CallInstruction(Type ty, String funName, List<Value> args) {
      this.result = null;
      this.ty = ty;
      this.funName = funName;
      this.args = args;
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

      for (Value arg : args) {
         sb.append(arg.getType().toString() + " ");
         sb.append(arg.toString() + ", ");
      }
      sb.delete(sb.length() - 1, sb.length());
      sb.append(")");

      return sb.toString();

   }
}


