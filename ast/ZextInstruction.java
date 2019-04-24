package ast;

public class ZextInstruction implements Instruction {

   private RegisterValue result;
   private RegisterValue from;

   public ZextInstruction(RegisterValue result, RegisterValue from) {
      this.result = result;
      this.from = from;
   }

   public String toString() {
      String retString = String.format("%s = zext i1 %s to i32",
                                       result.toString(), from.toString());
      return retString;
   }
}
