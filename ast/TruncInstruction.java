package ast;

public class TruncInstruction implements Instruction {

   private Value result;
   private Value from;

   public TruncInstruction(Value result, Value from) {
      this.result = result;
      this.from = from;
   }

   public String toString() {
      String retString = String.format("%s = trunc i32 %s to i1",
                                       result.toString(), from.toString());
      return retString;
   }
}
