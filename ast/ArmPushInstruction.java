package ast;

import java.lang.StringBuilder;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ArmPushInstruction implements ArmInstruction {

   private final List<Value> vals;

   public ArmPushInstruction(List<Value> vals) {
      this.vals = vals;
   }

   public ArmPushInstruction() {
      this.vals = null;
   }

   public String toString() {
      if (vals == null) {
         return "push {r4-r10}";
      }
      StringBuilder sb = new StringBuilder("push {");
      for (Value val : vals) {
         sb.append(val.toStringArm());
         sb.append(", ");
      }
      sb.delete(sb.length() - 2, sb.length());
      sb.append("}");
      return sb.toString();
   }
 
   public String toString(Map<String, String> regMap) {
      StringBuilder sb = new StringBuilder("push {");

      if (vals == null) {
         return "push {r4-r10}";
      }
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

      if (vals == null) {
         return sources;
      }
      for (Value val : vals) {
         if (!(val instanceof ImmediateValue)) {
            sources.add(val);
         }
      }
      return sources;
   }

   public Set<Value> getTargets() {
      return new HashSet<>();
   }


}
