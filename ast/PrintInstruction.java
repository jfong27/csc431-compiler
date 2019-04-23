package ast;

public class PrintInstruction implements Instruction {

   int x;

   public PrintInstruction(int x) {
      this.x = x;
   }

   public String toString() {
      return String.format("call i32 printf_int(%d)", x);
      //return String.format("store %s %s, %s* %s",
      //                     fromType.toString(), from.toString(),
      //                     toType.toString(), to.toString());
   }
}
