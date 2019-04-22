package ast;

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
}
