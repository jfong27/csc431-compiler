package ast;

public class ArmPrintInstruction implements Instruction {

   Value x;

   public ArmPrintInstruction(Value x) {
      this.x = x;
   }

   public String toString() {
      return String.format(".PRINT_FMT:\n\t.asciz %s\n\t.align 2\n", x.toString());
   }
}
