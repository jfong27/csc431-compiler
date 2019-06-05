package ast;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ArmMoveInstruction implements ArmInstruction {

   private final Value target;
   private final Value source;
   private final String cond;

   public ArmMoveInstruction(Value target, Value source) {
      this.target = target;
      this.source = source;
      this.cond = null;
   }

   public ArmMoveInstruction(Value target, Value source, String cond) {
      this.target = target;
      this.source = source;
      this.cond = cond;
   }

   public Set<Value> getTargets() {
      Set<Value> targets = new HashSet<>();
      if (!(target instanceof ImmediateValue)) {
         targets.add(target);
      }
      return targets;
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      if (!(source instanceof ImmediateValue)) {
         sources.add(source);
      }
      return sources;
   }

   public String toString() {
      String targetStr = target.toStringArm();
      String sourceStr = source.toStringArm();
      if (cond != null) {
         if (cond.equals("eq")) {
            return String.format("moveq %s, %s", 
                                 targetStr, sourceStr);
         } else if (cond.equals("ne")) {
            return String.format("movne %s, %s",
                                 targetStr, sourceStr);
         } else if (cond.equals("w")) {
            return String.format("movw %s, %s",
                                 targetStr, sourceStr);
         } else {
            String mov = cond.substring(1);
            return String.format("mov%s %s, %s",
                                 mov, targetStr, sourceStr);
         }
      }

      return String.format("mov %s, %s",   
                           targetStr, sourceStr);

   }

   public String toString(Map<String, String> regMap) {

      String targetStr;
      String sourceStr;

      if (target.toStringArm().equals("r0") || 
          target.toStringArm().equals("r1")) {
         targetStr = target.toStringArm();
      } else {
         targetStr = regMap.get(target.toStringArm());
      }
      
      if (source instanceof ImmediateValue ||
          source.toStringArm().equals("r0") ||
          source.toStringArm().equals("r1")) {
         sourceStr = source.toStringArm();
      } else {
         sourceStr = regMap.get(source.toStringArm());
      }

      if (cond != null) {
         if (cond.equals("eq")) {
            return String.format("moveq %s, %s", 
                                 targetStr, sourceStr);
         } else if (cond.equals("ne")) {
            return String.format("movne %s, %s",
                                 targetStr, sourceStr);
         } else if (cond.equals("w")) {
            return String.format("movw %s, %s",
                                 targetStr, sourceStr);
         } else {
            String mov = cond.substring(1);
            return String.format("mov%s %s, %s",
                                 mov, targetStr, sourceStr);
         }
      }

      return String.format("mov %s, %s",   
                           targetStr, sourceStr);
   }
}
