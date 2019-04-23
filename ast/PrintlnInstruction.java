package ast;

public class PrintlnInstruction implements Instruction {

   Value x;

   public PrintlnInstruction(Value x) {
      this.x = x;
   }

   public String toString() {
      return String.format("call i32 @printf_newline(i32 %s)", x.toString());
      //return String.format("store %s %s, %s* %s",
      //                     fromType.toString(), from.toString(),
      //                     toType.toString(), to.toString());
   }
}
