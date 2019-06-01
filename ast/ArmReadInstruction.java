package ast;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

//TODO: After register allocation, still must use r0
public class ArmReadInstruction implements ArmInstruction {

   private Value x;

   public ArmReadInstruction(Value x) {
      this.x = x;
   }

   public String toString(Map<String, String> regMap) {
      String str = "";
      str += "\tbl printf\n";
      str += String.format("\tmov %s, r0\n", x.toString());
      return str;
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      ArmRegister r0 = new ArmRegister(0);
      sources.add(r0);
      return sources;
   }

   public Set<Value> getTargets() {
      Set<Value> targets = new HashSet<>();
      if (!(x instanceof ImmediateValue)) {
         targets.add(x);
      }
      return targets;
   }

}
