package ast;

import java.lang.StringBuilder;

import java.util.ArrayList;
import java.util.List;
import java.util.Queue;

public class Block {

   private final String label;
   private List<Block> successors;
   private List<Instruction> instructions;
   private boolean alreadyPrinted = false;
   private boolean visited = false;

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

   public Queue BFS(Queue qu) {
      if (visited) {
         return qu;
      } else {
        visited = true;
      } 
      qu.add(this);
      for (Block successor : successors) {
         qu.add(successor);
      }

      for (Block successor : successors) {
         qu = successor.BFS(qu);
      }

      return qu;
   }

   public String toString() {
      if (alreadyPrinted) {
         return ""; 
      } else {
         alreadyPrinted = true;
      }

      StringBuilder blockString = new StringBuilder();

      blockString.append(label);
      blockString.append(":\n");

      for (Instruction instr : instructions) {
         blockString.append("\t" + instr.toString() + "\n");
      }

      return blockString.toString();
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

   public boolean isFinished() {
      int instrSize = instructions.size();
      if (instrSize == 0) {
         return false;
      }

      Instruction lastInstruction = instructions.get(instrSize - 1);
      return (lastInstruction instanceof UnconditionalBranchInstruction ||
              lastInstruction instanceof BranchInstruction || 
              lastInstruction instanceof ReturnEmptyInstruction ||
              lastInstruction instanceof ReturnInstruction);

   }


}
