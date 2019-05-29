package ast;

import java.util.HashSet;
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
      targets.add(target);
      return targets;
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      sources.add(source);
      return sources;
   }

   public String toString() {

      if (target == null) {
         return null;
         //return "NULL RESULT ARM MOVE";
      }

      if (cond != null) {
         if (cond.equals("eq")) {
            return String.format("moveq %s, %s", 
                                 target.toStringArm(),
                                 source.toStringArm());
         } else if (cond.equals("ne")) {
            return String.format("movne %s, %s",
                                 target.toString(),
                                 source.toStringArm());
         } else if (cond.equals("w")) {
            return String.format("movw %s, %s",
                                 target.toStringArm(),
                                 source.toStringArm());
         } else {
            String mov = cond.substring(1);
            return String.format("mov%s %s, %s",
                                 mov, target.toStringArm(),
                                 source.toStringArm());
         }
      }

      return String.format("mov %s, %s",   
                           target.toStringArm(),
                           source.toStringArm()); 
   }
}
