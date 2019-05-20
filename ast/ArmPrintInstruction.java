package ast;

public class ArmPrintInstruction implements ArmInstruction {

   Value x;

   public ArmPrintInstruction(Value x) {
      this.x = x;
   }

   public String toString() {
      String str = "";
      str += String.format("\tmov r0, %s\n", x.toString());
      str += "\tbl printf_int\n";
      return str;
   }
}
