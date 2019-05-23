package ast;

import java.util.Set;

public interface ArmInstruction {
   public String toString();
   public Value getTarget();
   public Set<Value> getSources();
}
