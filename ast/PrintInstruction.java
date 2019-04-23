package ast;

public class PrintInstruction implements Instruction {

   Value x;

   public PrintInstruction(Value x) {
      this.x = x;
   }

   public String toString() {
      return String.format("call i32 printf_int(%x)", x.toString());
      //return String.format("store %s %s, %s* %s",
      //                     fromType.toString(), from.toString(),
      //                     toType.toString(), to.toString());
   }
}
