package ast;

public class GetElemPtrInstruction implements Instruction {

   private final RegisterValue result;

   public GetElemPtrInstruction(RegisterValue result) {
      this.result = result;
   }

   public String toString() {
      String resultString = String.format("%s = getelementptr %s* %s, i1 0, i32 %s",
                                          result.toString(), "<ty>", "<ptrval>", "<index>");
      return resultString;
   }
}
