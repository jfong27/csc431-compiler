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
      return String.format("cmp %s, %s", source1.toStringArm(), source2.toStringArm());
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      if (!(source1 instanceof ImmediateValue)) {
         sources.add(source1);
      }
      if (!(source2 instanceof ImmediateValue)) {
         sources.add(source2);
      }
      return sources;
   }



   public Set<Value> getTargets() {
      return new HashSet<>();
   }
}
