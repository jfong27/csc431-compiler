package ast;

import java.util.List;

public interface Instruction {
   public String toString();
   public List<ArmInstruction> toArm();
}
