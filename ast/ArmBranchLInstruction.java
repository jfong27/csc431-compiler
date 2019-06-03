package ast;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ArmBranchLInstruction implements ArmInstruction {
   private final String label;

   public ArmBranchLInstruction(String label) {
      this.label = label;
   }

   public String toString() {
      return "bl " + label;
   }

   public String toString(Map<String, String> regMap) {
      return "bl " + label;
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      return sources;
   }

   public Set<Value> getTargets() {
      Set<Value> targets = new HashSet<>();
      Value r0 = new ArmRegister(0);
      Value r1 = new ArmRegister(1);
      Value r2 = new ArmRegister(2);
      Value r3 = new ArmRegister(3);

      targets.add(r0);
      targets.add(r1);
      targets.add(r2);
      targets.add(r3);

      return targets;
   }
}
