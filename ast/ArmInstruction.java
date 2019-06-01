package ast;

import java.util.Map;
import java.util.Set;

public interface ArmInstruction {
   public String toString(Map<String, String> regMap);
   public Set<Value> getTargets();
   public Set<Value> getSources();
}
