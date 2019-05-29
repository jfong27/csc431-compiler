package ast;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

//TODO: Accept list of vals to pop multiple values
public class ArmPopInstruction implements ArmInstruction {

   private final List<Value> vals;

   public ArmPopInstruction(List<Value> vals) {
      this.vals = vals;
   }

   public String toString() {
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
      return new HashSet<>(vals);
   }


}
