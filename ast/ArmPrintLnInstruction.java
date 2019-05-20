package ast;

public class ArmPrintLnInstruction implements ArmInstruction {

   Value x;

   public ArmPrintLnInstruction(Value x) {
      this.x = x;
   }

   public String toString() {
      String str = "";
      str += String.format("\tmov r0, %s\n", x.toString());
      str += "\tbl printf_newline\n";
      return str;
   }
}
