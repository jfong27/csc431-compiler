package ast;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ArmNotInstruction implements ArmInstruction {

   private final Value target;
   private final Value opnd;

   public ArmNotInstruction(Value target, Value opnd) {
      this.target = target;
      this.opnd = opnd;
   }

   public String toString(Map<String, String> regMap) {
      return "ARM NOT";
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      if (!(opnd instanceof ImmediateValue)) {
         sources.add(opnd);
      }
      return sources;
   }

   public Set<Value> getTargets() {
      Set<Value> targets = new HashSet<>();
      if (!(target instanceof ImmediateValue)) {
         targets.add(target);
      }
      return targets;
   }

}
