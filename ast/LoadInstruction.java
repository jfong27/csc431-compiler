package ast;

public class LoadInstruction implements Instruction {

   private RegisterValue result;
   private Type ty;
   private Value pointer;
   private boolean isGlobal;

   public LoadInstruction(RegisterValue result, Type ty, 
                          Value pointer, boolean isGlobal) {
      this.result = result;
      this.ty = ty;
      this.pointer = pointer;
      this.isGlobal = isGlobal;
   }

   public String toString() {
      String tyString = ty.toString();
      String pointerString;

      if (isGlobal) {
         pointerString = "@" + ((RegisterValue)pointer).getName();
      } else {
        pointerString = pointer.toString();
      } 

      String retString = String.format("%s = load %s* %s",
                                       result.toString(), tyString,
                                       pointerString);
      return retString;
   }
}
