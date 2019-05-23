package ast;

public interface ArmInstruction {
   public String toString();
   public Value getTarget();
   public Set<Value> getSources();
}
