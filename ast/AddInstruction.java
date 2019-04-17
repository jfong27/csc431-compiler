package ast;

public class AddInstruction implements Instruction {

   private final Type type;
   private final Expression op1;
   private final Expression op2;

   public AddInstruction(Type type, Expression op1, Expression op2) {
      this.type = type;
      this.op1 = op1;
      this.op2 = op2;
   }


   public String toString() {
      return "add <ty> <op1>, <op2>";
   }

}
