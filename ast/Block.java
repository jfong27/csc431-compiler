package ast;

import java.lang.StringBuilder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Queue;

public class Block {

   private final String label;
   private List<Block> predecessors;
   private List<Block> successors;
   private List<Instruction> phis;
   private List<Instruction> instructions;
   private Map<String, Value> idMap;
   private boolean alreadyPrinted = false;
   private boolean visited = false;
   private boolean isSealed = false;

   public Block(String label, List<Block> predecessors,
                List<Block> successors, List<Instruction> instructions,
                Map<String, Value> idMap) {
      this.label = label;
      this.predecessors = predecessors;
      this.successors = successors;
      this.instructions = instructions;
      this.idMap = idMap;
   }

   public Block(String label) {
      this.label = label;
      this.predecessors = new ArrayList<>();
      this.successors = new ArrayList<>();
      this.phis = new ArrayList<>();
      this.instructions = new ArrayList<>();
      this.idMap = new HashMap<>();
   }

   public void clearInstructions() {
      instructions.clear();
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
      if (alreadyPrinted) { return "" ; }
      alreadyPrinted = true;

      StringBuilder blockString = new StringBuilder();

      blockString.append(label);
      blockString.append(":\n");

      for (Instruction instr : instructions) {
         blockString.append("\t" + instr.toString() + "\n");
      }

      return blockString.toString();
   }

   public void seal() {
      this.isSealed = true;
   }

   public boolean isSealed() {
      return isSealed;
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

   public List<Instruction> getPhis() {
      return phis;
   }

   public void addInstruction(Instruction s) {
      instructions.add(s);
   }

   public void addSuccessor(Block b) {
      successors.add(b);
   }

   public void addPredecessor(Block b) {
      predecessors.add(b);
   }

   public void addPhi(PhiInstruction phi) {
      phis.add(phi);
   }

   public Map<String, Value> getIdMap() {
      return idMap;
   }

   public void setIdMap(Map<String, Value> idMap) {
      this.idMap = idMap;
   }

   public void updateMap(String s, Value v) {
      idMap.put(s, v);
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
