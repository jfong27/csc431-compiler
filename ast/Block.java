package ast;

import java.lang.StringBuilder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
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
   private List<ArmInstruction> armPhiMoves; 
   private boolean alreadyPrinted = false;
   private boolean visited = false;
   private boolean isSealed = false;


   public Block(String label) {
      this.label = label;
      this.predecessors = new ArrayList<>();
      this.successors = new ArrayList<>();
      this.phis = new HashMap<>();
      this.instructions = new ArrayList<>();
      this.idMap = new HashMap<>();
      this.armPhiMoves = new ArrayList<>();
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
         qu = successor.BFS(qu);
      }

      return qu;
   }


   public Queue<Block> moveExitBlock(Queue<Block> qu) {
      Block exitBlock = (Block)qu.remove();
      int blockNum = Integer.parseInt(exitBlock.getLabel().split("LU")[1]);
      int lowestBlockNum = blockNum;

      Queue<Block> tmp = new LinkedList<>();
      if (qu.peek() != null) {
         tmp.add(exitBlock);
      }
      while (qu.peek() != null) {
         Block currBlock = qu.remove();
         blockNum = Integer.parseInt(currBlock.getLabel().split("LU")[1]);
         if (blockNum < lowestBlockNum) {
            exitBlock = currBlock;
            lowestBlockNum = blockNum;
         } else {
            tmp.add(currBlock);
         }
      }
      tmp.add(exitBlock);

      return tmp;
   } 

   public void addArmPhiMove(ArmInstruction move) {
      armPhiMoves.add(move);
   }

   
   //Instructions are LLVM. Need to convert each instruction to
   //list of ARM instructions, then call toString for each.  
   public String toStringArm(boolean isFirst, Function func) {
      if (alreadyPrinted) { return "" ; }
      alreadyPrinted = true;

      StringBuilder blockString = new StringBuilder();

      blockString.append("." + label);
      blockString.append(":\n");

      //blockString.append("\n------ Phi Moves ------\n");
      //for (ArmInstruction i : armPhiMoves) {
        // blockString.append(i.toString() + "\n");
     // }
      //blockString.append("-----------------------\n");
      
      if (isFirst) {
         blockString.append("\t\tpush {fp, lr}\n");
         blockString.append("\t\tadd fp, sp, #4\n");
         blockString.append(moveArgs(func));
      }

      List<ArmInstruction> armInstructions = new ArrayList<>();

      System.out.println("Curr block: " + label);
      for (Object value : phis.values()) {
         PhiInstruction phiInstr = (PhiInstruction)value;
         for (ValueLabelPair phis : phiInstr.getPhis()) {
            System.out.println(phis.getLabel() + phis.getValue().toString());
         }
         armInstructions.addAll(phiInstr.toArm());
      }

      //TODO: Need to add the arm phi moves before the last instruction (Branch)
      Instruction lastInstr = instructions.remove(instructions.size() -1);
      for (Instruction instr : instructions) {
         armInstructions.addAll(instr.toArm());
      }
      armInstructions.addAll(armPhiMoves);
      armInstructions.addAll(lastInstr.toArm());

      for (ArmInstruction instr : armInstructions) {
         String instrString = instr.toString();
         if (instrString != null) {
            blockString.append("\t\t" + instr.toString() + "\n");
         }
      }

      return blockString.toString();
   }

   private String moveArgs(Function func) {
      StringBuilder sb = new StringBuilder();

      int counter = 0;
      for (Declaration decl : func.getParams()) {
         sb.append(String.format("\t\tmov %%%s, r%s\n",
                                  decl.getName(), counter++));
      }
      return sb.toString();
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

   public void writeVariable(String variable, Value value, Block block) {
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
