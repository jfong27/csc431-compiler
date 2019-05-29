package ast;

import java.util.HashSet;
import java.util.Set;

public class ArmStoreInstruction implements ArmInstruction {

   private final Value target;
   private final Value source;

   public ArmStoreInstruction(Value target, Value source) {
      this.target = target;
      this.source = source;
   }

   public String toString() {

      return String.format("str %s, [%s]", 
                           target.toStringArm(),
                           source.toStringArm());
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      sources.add(source);
      return sources;
   }

   public Set<Value> getTargets() {
      Set<Value> targets = new HashSet<>();
      targets.add(target);
      return targets;
   }

}
