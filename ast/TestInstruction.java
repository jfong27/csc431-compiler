package ast;

public class TestInstruction implements Instruction {

   private final String label;

   public TestInstruction(String label) {
      this.label = label;
   }

   public String toString() {

      return "Test instruction: " + label;
   }
}
