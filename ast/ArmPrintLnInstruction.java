package ast;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ArmPrintLnInstruction implements ArmInstruction {

   Value x;

   public ArmPrintLnInstruction(Value x) {
      this.x = x;
   }

   public String toString() {
      String str = "";
      String xStr;

      xStr = x.toString();
      str += String.format("\tmov r0, %s\n", xStr);
      str += "\tbl printf_newline\n";
      return str;
   }

 
   public String toString(Map<String, String> regMap) {
      String str = "";
      String xStr;

      if (x instanceof ImmediateValue) {
         xStr = x.toString();
      } else {
         xStr = regMap.get(x.toString());
      }
      str += String.format("\tmov r0, %s\n", xStr);
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
