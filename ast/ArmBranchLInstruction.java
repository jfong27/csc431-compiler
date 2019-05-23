package ast;

import java.util.HashSet;
import java.util.Set;

public class ArmBranchLInstruction implements ArmInstruction {
   private final String label;

   public ArmBranchLInstruction(String label) {
      this.label = label;
   }

   public String toString() {
      return "bl " + label;
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      return sources;
   }

   public Value getTarget() {
      return null;
   }
}
