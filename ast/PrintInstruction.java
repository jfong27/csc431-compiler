package ast;

public class PrintInstruction implements Instruction {

   Value x;

   public PrintInstruction(Value x) {
      this.x = x;
   }

   public String toString() {
      return String.format("call void @printf_int(i32 %s)", x.toString());
   }
}
