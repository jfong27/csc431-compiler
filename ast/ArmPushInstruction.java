package ast;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

//TODO: Accept list of vals to push multiple values
public class ArmPushInstruction implements ArmInstruction {

   public ArmPushInstruction(List<Value> vals) {
   }

   public String toString() {
      return "push {fp, lr}";
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      return sources;
   }

   public Value getTarget() {
      return null;
   }


}
