package ast;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

//TODO: Accept list of vals to pop multiple values
public class ArmPopInstruction implements ArmInstruction {

   public ArmPopInstruction(List<Value> vals) {
   }

   public String toString() {
      return "pop {fp, pc}";
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      return sources;
   }

   public Value getTarget() {
      return null;
   }


}
