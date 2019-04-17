package ast;

import java.util.ArrayList;
import java.util.List;

public class Block {

   private final String label;
   private List<Block> successors;
   // Should instructions be list of statements? or expressions?
   // Problem w/ stmt: block statement
   // Problem w/ expression: no assignment expression. a = 5;
   private List<Instruction> instructions;

   public Block(String label, List<Block> successors,
                List<Instruction> instructions) {
      this.label = label;
      this.successors = successors;
      this.instructions = instructions;
   }

   public Block(String label) {
      this.label = label;
      this.successors = new ArrayList<>();
      this.instructions = new ArrayList<>();
   }

   public String getLabel() {
      return label;
   }

   public List<Block> getSuccessors() {
      return successors;
   }

   public List<Instruction> getInstructions() {
      return instructions;
   }

   public void addInstruction(Instruction s) {
      instructions.add(s);
   }

   public void addSuccessor(Block b) {
      successors.add(b);
   }



}
