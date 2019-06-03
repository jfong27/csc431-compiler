package ast;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ArmStoreInstruction implements ArmInstruction {

   private final Value target;
   private final Value source;

   public ArmStoreInstruction(Value target, Value source) {
      this.target = target;
      this.source = source;
   }

   public String toString() {

      String targetStr;
      String sourceStr;

      targetStr = target.toStringArm();
      sourceStr = source.toStringArm();
      return String.format("str %s, [%s]", 
                           targetStr, sourceStr);
   }

 
   public String toString(Map<String, String> regMap) {

      String targetStr;
      String sourceStr;

      targetStr = regMap.get(target.toStringArm());
      if (source instanceof ImmediateValue) {
         sourceStr = source.toStringArm();
      } else {
         sourceStr = regMap.get(source.toStringArm());
      }
      return String.format("str %s, [%s]", 
                           targetStr, sourceStr);
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      if (!(source instanceof ImmediateValue)) {
         sources.add(source);
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
