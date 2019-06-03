package ast;

import java.util.HashSet;
import java.util.Map;
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

   public String toString(Map<String, String> regMap) {
      String targetStr;
      String source1Str;
      String source2Str;

      targetStr = target.toStringArm();
      if (!targetStr.equals("fp")) {
         targetStr = regMap.get(target.toStringArm());
      }
      if (source1 instanceof ImmediateValue) {
         source1Str = source1.toStringArm();
      } else {
         if (!regMap.containsKey(source1.toStringArm())) {
            source1Str = source1.toStringArm();
         } else {
            source1Str = regMap.get(source1.toStringArm());
         }
      }
      if (source2 instanceof ImmediateValue) {
         source2Str = source2.toStringArm();
      } else {
         source2Str = regMap.get(source2.toStringArm());
      }
 
      return String.format("%s %s, %s, %s",   
                           operator, targetStr,
                           source1Str, source2Str);
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
      Set<Value> targets = new HashSet<>();
      System.out.println("TARGETTTT: " + target.toStringArm());
      if (!(target instanceof ImmediateValue) &&
          !(target.toStringArm().equals("fp"))) {
         targets.add(target);
         System.out.println("It's a target");
      } else {
         System.out.println("NOT TARGET");
      }
      return targets;
   }

}
