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

   public String toString() {
      if (source1 instanceof ImmediateValue) {
         return String.format("cmp %s, %s", source2.toStringArm(), 
                                            source1.toStringArm());
      }

      return String.format("cmp %s, %s", source1.toStringArm(), 
                                         source2.toStringArm());
   }
   public String toString(Map<String, String> regMap) {
      String source1Str;
      String source2Str;
      String compare = "cmp";

      if (source1 instanceof ImmediateValue) {
         ImmediateValue src1 = (ImmediateValue)source1;
         if (src1.getVal() < 0) {
            compare = "cmn";
         }
         source1Str = source1.toStringArm();
      } else {
         source1Str = regMap.get(source1.toStringArm());
      }
      if (source2 instanceof ImmediateValue) {
         ImmediateValue src2 = (ImmediateValue)source2;
         if (src2.getVal() < 0) {
            compare = "cmn";
         }
         source2Str = source2.toStringArm();
         return String.format("%s %s, %s", compare, source1Str, source2Str);
      }

      source2Str = regMap.get(source2.toStringArm());
      return String.format("%s %s, %s", compare, source2Str, source1Str);

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
