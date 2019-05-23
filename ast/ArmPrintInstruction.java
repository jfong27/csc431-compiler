package ast;

import java.util.HashSet;
import java.util.Set;

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

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      sources.add(x);
      return sources;
   }

   public Value getTarget() {
      return null;
   }

}
