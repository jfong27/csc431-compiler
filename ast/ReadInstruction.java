package ast;

public class ReadInstruction implements Instruction {

   private final RegisterValue result;

   public ReadInstruction(RegisterValue result) {
      this.result = result;
   }

   public String toString() {
      return String.format("%s = call i32 @read()", result.toString());
      //return String.format("store %s %s, %s* %s",
      //                     fromType.toString(), from.toString(),
      //                     toType.toString(), to.toString());
   }
}
