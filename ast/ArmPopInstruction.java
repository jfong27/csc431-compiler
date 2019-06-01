package ast;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ArmPopInstruction implements ArmInstruction {

   private final List<Value> vals;

   public ArmPopInstruction(List<Value> vals) {
      this.vals = vals;
   }

   public String toString(Map<String, String> regMap) {
      StringBuilder sb = new StringBuilder("pop {");
      for (Value val : vals) {
         sb.append(val.toStringArm());
         sb.append(", ");
      }
      sb.delete(sb.length() - 2, sb.length());
      sb.append("}");
      return sb.toString();
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      return sources;
   }

   public Set<Value> getTargets() {
      Set<Value> targets = new HashSet<>();
      for (Value val : vals) {
         if (!(val instanceof ImmediateValue)) {
            targets.add(val);
         }
      }
      return targets;
   }


}
