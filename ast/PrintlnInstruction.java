package ast;

public class PrintlnInstruction implements Instruction {

   int x;

   public PrintlnInstruction(int x) {
      this.x = x;
   }

   public String toString() {
      return String.format("call i32 @printf_newline(i32 %d)", x);
      //return String.format("store %s %s, %s* %s",
      //                     fromType.toString(), from.toString(),
      //                     toType.toString(), to.toString());
   }
}
