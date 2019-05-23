package ast;

import java.util.HashSet;
import java.util.Set;

public class ArmLoadInstruction implements ArmInstruction {

   private final Value target;
   private final Value source;

   public ArmLoadInstruction(Value target, Value source) {
      this.target = target;
      this.source = source;
   }

   public String toString() {

      return String.format("ldr %s, [%s]", 
                           target.toStringArm(),
                           source.toStringArm());
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      sources.add(source);
      return sources;
   }

   public Value getTarget() {
      return target;
   }
}

