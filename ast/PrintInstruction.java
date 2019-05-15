package ast;

import java.util.ArrayList;
import java.util.List;

public class PrintInstruction implements Instruction {

   Value x;

   public PrintInstruction(Value x) {
      this.x = x;
   }

   public String toString() {
      return String.format("call void @printf_int(i32 %s)", x.toString());
   }

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();
      return armInstrucs;
   }
}
