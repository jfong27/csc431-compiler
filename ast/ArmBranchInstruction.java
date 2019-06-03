package ast;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ArmBranchInstruction implements ArmInstruction {

   private final String label;

   public ArmBranchInstruction(String label) {
      this.label = label;
   }

   public String toString() {
      return "b ." + label;
   } 

   public String toString(Map<String, String> regMap) {
      return "b ." + label;
   } 

   public Set<Value> getSources() {
       return new HashSet<>();
   }

   public Set<Value> getTargets() {
      return new HashSet<>();
   }
}
