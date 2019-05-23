package ast;

import java.util.HashSet;
import java.util.Set;

public class ArmNotInstruction implements ArmInstruction {

   private final RegisterValue target;
   private final Value opnd;

   public ArmNotInstruction(RegisterValue target, Value opnd) {
      this.target = target;
      this.opnd = opnd;
   }

   public String toString() {
      return "ARM NOT";
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      sources.add(opnd);
      return sources;
   }

   public Value getTarget() {
      return target;
   }

}
