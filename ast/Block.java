package ast;

import java.lang.StringBuilder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;

public class Block {

   private final String label;
   private List<Block> predecessors;
   private List<Block> successors;
   private Map<String, PhiInstruction> phis;
   private List<Instruction> instructions;
   private List<ArmInstruction> armInstructions;
   private Map<String, Value> idMap;
   private List<ArmInstruction> armPhiMoves; 
   private Set<Value> gen;
   private Set<Value> kill;
   private Set<Value> liveOut;
   private int numInstructions = 0;
   private boolean alreadyPrinted = false;
   private boolean visited = false;
   private boolean isSealed = false;
   private boolean seen = false;


   public Block(String label) {
      this.label = label;
      this.predecessors = new ArrayList<>();
      this.successors = new ArrayList<>();
      this.phis = new HashMap<>();
      this.instructions = new ArrayList<>();
      this.armInstructions = new ArrayList<>();
      this.idMap = new HashMap<>();
      this.armPhiMoves = new ArrayList<>();
      this.gen = new HashSet<>();
      this.kill = new HashSet<>();
      this.liveOut = new HashSet<>();
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

   public Set<Value> getGenSet() { return gen;}

   public Set<Value> getKillSet() { return kill;}

   public Set<Value> getLiveOut() { return liveOut;}

   public int getNumInstructions() {
      return phis.size() + instructions.size();
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

   public void toArmInstructions(boolean isFirst, Function func) {
      if (isFirst) {
         ArmRegister fp = new ArmRegister("fp");
         ArmRegister lr = new ArmRegister("lr");
         ArmRegister sp = new ArmRegister("sp");
         ImmediateValue four = new ImmediateValue(4, new IntType());
         List<Value> pushVals = new ArrayList<>();
         pushVals.add(fp);
         pushVals.add(lr);
         armInstructions.add(new ArmPushInstruction(pushVals));
         armInstructions.add(new ArmBinaryInstruction(fp, "add", sp, four));
         armInstructions.add(new ArmPushInstruction());
         armInstructions.addAll(moveArgs(func));
      }

      for (Object value : phis.values()) {
         PhiInstruction phiInstr = (PhiInstruction)value;
         armInstructions.addAll(phiInstr.toArm());
      }

      if (instructions.size() > 0) {
         Instruction lastInstr = instructions.remove(instructions.size() - 1);
         for (Instruction instr : instructions) {
            armInstructions.addAll(instr.toArm());
         }

         armInstructions.addAll(armPhiMoves);
         armInstructions.addAll(lastInstr.toArm());
      }

   }


   //Instructions are LLVM. Need to convert each instruction to
   //list of ARM instructions, then call toString for each.  
   public String toStringArm(Map<String, String> registerMap) {
      if (alreadyPrinted) { return "" ; }
      alreadyPrinted = true;

      StringBuilder blockString = new StringBuilder();

      blockString.append("." + label);
      blockString.append(":\n");

      for (ArmInstruction instr : armInstructions) {
         String instrString = instr.toString(registerMap);
         if (instrString != null) {
            blockString.append("\t\t" + instrString + "\n");
         }
      }

      return blockString.toString();
   }

   // Without register allocation for debugging
   public String toStringArm() {
      if (alreadyPrinted) { return "" ; }
      alreadyPrinted = true;

      StringBuilder blockString = new StringBuilder();

      blockString.append("." + label);
      blockString.append(":\n");

      for (ArmInstruction instr : armInstructions) {
         String instrString = instr.toString();
         if (instrString != null) {
            blockString.append("\t\t" + instrString + "\n");
         }
      }

      return blockString.toString();
   }

   public void generateGenKill() {
      for (ArmInstruction armInstr : armInstructions) {
         for (Value source : armInstr.getSources()) {
            if (!kill.contains(source) && !(source instanceof ImmediateValue)) {
               gen.add(source);
            } 
         }

         for (Value target : armInstr.getTargets()) {
            if (target != null && !(target instanceof ImmediateValue)) {
               kill.add(target);
            }
         }
      }
      System.out.println("Block: " + label);
      System.out.println("Gen set: " + gen.toString());
      System.out.println("Kill set: " + kill.toString());
   }

   public boolean createLiveOut() {
      System.out.println("Creating live out for " + label);
      boolean changed = false;

      for (Block succ : successors) {
         Set<Value> newLiveOut = new HashSet<>(liveOut);
         newLiveOut.addAll(succ.getGenSet());
         Set<Value> tmp = new HashSet<>(succ.getLiveOut());
         tmp.removeAll(succ.getKillSet());
         newLiveOut.addAll(tmp);
         if (!newLiveOut.equals(liveOut)) {
            changed = true;
            liveOut = newLiveOut;
         } 
      }

      System.out.println("Changed? " + changed);
      return changed;
   }

   private List<ArmInstruction> moveArgs(Function func) {
      List<ArmInstruction> moveInstrucs = new ArrayList<>();

      int counter = 0;
      for (Declaration decl : func.getParams()) {
         if (counter > 3) {
            System.out.println("TOO MANY ARGS FOR REG");
            break;
         }
         ArmRegister armReg = new ArmRegister(counter++);
         RegisterValue nameReg = new RegisterValue(decl.getName());
         moveInstrucs.add(new ArmMoveInstruction(nameReg, armReg));
      }

      return moveInstrucs;
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

   public List<ArmInstruction> getArmInstructions() {
      return armInstructions;
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
