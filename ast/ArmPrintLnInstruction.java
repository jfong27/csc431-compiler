package ast;

import java.util.HashSet;
import java.util.Set;

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

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      if (!(x instanceof ImmediateValue)) {
         sources.add(x);
      }
      return sources;
   }

   public Set<Value> getTargets() {
      return new HashSet<>();
   }

}
