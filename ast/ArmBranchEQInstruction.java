package ast;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ArmBranchEQInstruction implements ArmInstruction {

   private final String label;

   public ArmBranchEQInstruction(String label) {
      this.label = label;
   }

   public String toString(Map<String, String> regMap) {
      return "beq ." + label;
   } 

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      return sources;
   }

   public Set<Value> getTargets() {
      return new HashSet<>();
   }
}
