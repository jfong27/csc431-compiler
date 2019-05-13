package ast;

import java.lang.StringBuilder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Queue;

public class Block {

   private final String label;
   private List<Block> predecessors;
   private List<Block> successors;
   private Map<String, PhiInstruction> phis;
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
      this.phis = new HashMap<>();
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
   
   //Instructions are LLVM. Need to convert each instruction to
   //list of ARM instructions, then call toString for each.  
   public String toStringArm() {
      if (alreadyPrinted) { return "" ; }
      alreadyPrinted = true;

      StringBuilder blockString = new StringBuilder();

      blockString.append(label);
      blockString.append(":\n");
      /* Push should only go in entry node
      blockString.append("\tpush {fp, lr}\n");
      */

      List<ArmInstruction> armInstructions = new ArrayList<>();
      for (Instruction instr : instructions) {
         armInstructions.append(instr.toArm());
      }

      for (ArmInstruction instr : armInstructions) {
         blockString.append("\t" + instr.toString() + "\n");
      }

      /* Pop should only go in exit node
      blockString.append("\tpop {fp, pc}\n");
      */

      return blockString.toString();
   }

   public String toString() {
      if (alreadyPrinted) { return "" ; }
      alreadyPrinted = true;

      StringBuilder blockString = new StringBuilder();

      blockString.append(label);
      blockString.append(":\n");

      Iterator iter = phis.entrySet().iterator();
      while (iter.hasNext()) {
         Map.Entry pair = (Map.Entry)iter.next();
         List<ValueLabelPair> phiOps = ((PhiInstruction)pair.getValue()).getPhis();
         if (phiOps.size() == 0) {
            continue;
         }
         blockString.append("\t" + pair.getValue().toString() + "\n");
      }

      for (Instruction instr : instructions) {
         blockString.append("\t" + instr.toString() + "\n");
      }

      return blockString.toString();
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

   public List<Block> getPredecessors() {
      return predecessors;
   }

   public List<Instruction> getInstructions() {
      return instructions;
   }

   public Map<String, PhiInstruction> getPhis() {
      return phis;
   }

   public int numSuccessors() {
      return successors.size();
   }

   public int numPredecessors() {
      return predecessors.size();
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

   public void addPhi(String variable, PhiInstruction phi) {
      phis.put(variable, phi);
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

   private void writeVariable(String variable, Value value, Block block) {
      block.updateMap(variable, value);
   }

   public Value readVariable(String variable, Type type, Block block) {

      Map<String, Value> idMap = block.getIdMap();
      if (idMap.containsKey(variable)) {
         return idMap.get(variable);
      }
      for (Block b : block.getPredecessors()) {
         System.out.println(b.getLabel());
      }
      return readVariableFromPredecessors(variable, type, block);

   }

   private Value readVariableFromPredecessors(String variable, Type type, Block block) {
      Value val;
      if (!block.isSealed()) {
         val = new RegisterValue(variable + Counter.getVariableCount(variable), type);
         PhiInstruction phiInstr = new PhiInstruction(val, type);
         block.addPhi(variable, phiInstr);
      } else if (block.numPredecessors() == 0) {
         val = new ImmediateValue(-1, new NullType());
      } else if (block.numPredecessors() == 1) {
         val = readVariable(variable, type, block.getPredecessors().get(0));
      } else {
         val = new RegisterValue(variable + Counter.getVariableCount(variable), type);
         PhiInstruction phiInstr = new PhiInstruction(val, type);
         block.addPhi(variable, phiInstr);
         writeVariable(variable, val, block);
         addPhiOperands(variable, block);
      } 

      writeVariable(variable, val, block);
      return val;
   }

   private void addPhiOperands(String variable, Block block) {
      PhiInstruction currPhi = phis.get(variable);

      for (Block predecessor : predecessors) {
         System.out.println(variable);
         System.out.println(currPhi);
         System.out.println("CurrPhi: " + currPhi.toString());
         Value val = readVariable(variable, currPhi.getType(), predecessor);
         if (!(val.getType() instanceof NullType)) {
            currPhi.addPhiValue(val, predecessor.getLabel());
         } 
      }

   }

   public void seal() {
      Iterator iter = phis.entrySet().iterator();
      while (iter.hasNext()) {
         Map.Entry pair = (Map.Entry)iter.next();
         String variable = (String)pair.getKey();
         addPhiOperands(variable, this);
      }
      isSealed = true;
   }

   public void removeTrivialPhis() {

   }



}
