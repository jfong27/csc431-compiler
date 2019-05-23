package ast;

import java.util.HashSet;
import java.util.Set;

public class ArmComparisonInstruction implements ArmInstruction {

   private final Value source1;
   private final Value source2;

   public ArmComparisonInstruction(Value source1, Value source2) {
      this.source1 = source1;
      this.source2 = source2;
   }

   public String toString() {
      return String.format("cmp %s, %s", source1.toStringArm(), source1.toStringArm());
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      sources.add(source1);
      sources.add(source2);
      return sources;
   }

   public Value getTarget() {
      return null;
   }
}
