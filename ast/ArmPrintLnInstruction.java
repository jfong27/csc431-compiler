package ast;

public class ArmPrintLnInstruction implements ArmInstruction {

   Value x;

   public ArmPrintLnInstruction(Value x) {
      this.x = x;
   }

   public String toString() {
      return String.format(".PRINT_FMT:\n\t.asciz %s\\n\n\t.align 2\n", x.toString());
   }
}
