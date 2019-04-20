package ast;

public class ReturnEmptyInstruction implements Instruction {

   public ReturnEmptyInstruction() {
   }

   public String toString() {
      return "ret void";
   }
}
