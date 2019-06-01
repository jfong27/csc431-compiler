package ast;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ArmPrintInstruction implements ArmInstruction {

   Value x;

   public ArmPrintInstruction(Value x) {
      this.x = x;
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
      str += "\tbl printf_int\n";
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
