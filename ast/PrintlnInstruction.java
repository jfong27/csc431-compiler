package ast;

import java.util.ArrayList;
import java.util.List;

public class PrintlnInstruction implements Instruction {

   Value x;

   public PrintlnInstruction(Value x) {
      this.x = x;
   }

   public String toString() {
      return String.format("call void @printf_newline(i32 %s)", x.toString());
   }
   
   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();
      return armInstrucs;
   }

}
