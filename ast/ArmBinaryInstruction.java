package ast;

import java.util.HashSet;
import java.util.Set;

public class ArmBinaryInstruction implements ArmInstruction {

   private final Value target;
   private final String operator;
   private final Value source1;
   private final Value source2;

   public ArmBinaryInstruction(Value target, String operator,
                            Value source1, Value source2) {
      this.target = target;
      this.operator = operator;
      this.source1 = source1;
      this.source2 = source2;
   }

   public String toString() {
      return String.format("%s %s, %s, %s",   
                           operator, target.toStringArm(),
                           source1.toStringArm(), 
                           source2.toStringArm());
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      sources.add(source1);
      sources.add(source2);
      return sources;
   }

   public Set<Value> getTargets() {
      Set<Value> targets = new HashSet<>();
      targets.add(target);
      return targets;
   }

}
