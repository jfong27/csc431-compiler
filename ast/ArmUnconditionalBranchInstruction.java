package ast;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ArmUnconditionalBranchInstruction implements ArmInstruction {

   private final String blockLabel;

   public ArmUnconditionalBranchInstruction(String blockLabel) {
      this.blockLabel = blockLabel;
   }

   public String toString() {
      return "b ." + blockLabel;
   }


   public String toString(Map<String, String> regMap) {
      return "b ." + blockLabel;
   }

   public Set<Value> getSources() {
      return new HashSet<>();
   }

   public Set<Value> getTargets() {
      return new HashSet<Value>();
   }
}
