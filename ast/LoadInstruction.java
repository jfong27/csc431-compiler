package ast;

public class LoadInstruction implements Instruction {

   private RegisterValue result;
   private Type ty;
   private Value pointer;

   public LoadInstruction(RegisterValue result, Type ty, Value pointer) {
      this.result = result;
      this.ty = ty;
      this.pointer = pointer;
   }

   public String toString() {
      String tyString = ty.toString();
      /*
      if (ty instanceof StructType) {
         tyString += "*";
      }
      */
      String retString = String.format("%s = load %s* %s",
                                       result.toString(), ty,
                                       pointer.toString());
      return retString;
   }
}
