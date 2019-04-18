package ast;

public class CallInstruction implements Instruction {

   RegisterValue result;
   
   public CallInstruction(RegisterValue result) {
      this.result = result;
   }

   public String toString() {
      return String.format("%s = call <ty> <fnptrval>()",
                           result.toString());
   }
}


