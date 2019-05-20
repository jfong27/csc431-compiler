package ast;

public class ArmReadInstruction implements ArmInstruction {

   Value x;

   public ArmReadInstruction(Value x) {
      this.x = x;
   }

   public String toString() {
      String str = "";
      str += "\tbl printf\n";
      str += String.format("\tmov %s, r0\n", x.toString());
      return str;
   }
}
