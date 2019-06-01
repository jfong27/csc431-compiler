package ast;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ArmComparisonInstruction implements ArmInstruction {

   private final Value source1;
   private final Value source2;

   public ArmComparisonInstruction(Value source1, Value source2) {
      this.source1 = source1;
      this.source2 = source2;
   }

   public String toString(Map<String, String> regMap) {
      String source1Str;
      String source2Str;

      if (source1 instanceof ImmediateValue) {
         source1Str = source1.toStringArm();
      } else {
         source1Str = regMap.get(source1.toStringArm());
      }
      if (source2 instanceof ImmediateValue) {
         source2Str = source2.toStringArm();
      } else {
         source2Str = regMap.get(source2.toStringArm());
      }
 
      return String.format("cmp %s, %s", source1Str, source2Str);
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
