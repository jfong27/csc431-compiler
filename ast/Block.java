package ast;

import java.util.List;

public class Block {

   private final String label;
   private final List<Block> successors;
   private final List<Statement> instructions;

   public Block(String label, List<Block> successors,
                List<Statement> instructions) {
      this.label = label;
      this.successors = successors;
      this.instructions = instructions;
   }

   public String getLabel() {
      return label;
   }

   public List<Block> getSuccessors() {
      return successors;
   }

   public List<Statement> getInstructions() {
      return instructions;
   }

}
