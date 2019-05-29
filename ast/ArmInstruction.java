package ast;

import java.util.Set;

public interface ArmInstruction {
   public String toString();
   public Set<Value> getTargets();
   public Set<Value> getSources();
}
