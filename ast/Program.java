package ast;

import java.lang.StringBuilder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Queue;
import java.util.Set;
import java.util.Stack;

public class Program
{
   private final List<TypeDeclaration> types;
   private final List<Declaration> decls;
   private final List<Function> funcs;
   private final HashMap<String, IdProperties> symTable;
   private String utilFuncString;
   private String declStrings;
  
   public Program(List<TypeDeclaration> types, List<Declaration> decls,
                  List<Function> funcs) {
      this.types = types;
      this.decls = decls;
      this.funcs = funcs;
      this.symTable = initSymTable();
      this.utilFuncString = "declare i8* @malloc(i32)\n" + 
                            "declare void @printf_int(i32 %x)\n" +
                            "declare void @printf_newline(i32 %x)\n" + 
                            "declare void @free(i8* %x)\n" +
                            "declare i32 @read()\n";
      this.declStrings = "";
  }

   public List<Block> createCFGs(Map<String, StructProperties> structTable) {

      ArrayList<Block> funcGraphs = new ArrayList<>();

      for (Function func : funcs) {
         funcGraphs.add(func.createCFG(symTable, structTable));
      }

      return funcGraphs;

   }

   public List<Block> createCFGsSSA(Map<String, StructProperties> structTable) {

      ArrayList<Block> funcGraphs = new ArrayList<>();

      for (Function func : funcs) {
         funcGraphs.add(func.createCFGSSA(symTable, structTable));
         Counter.resetVariableCounter();
      }

      return funcGraphs;

   }


   public String toStringSSA(Map<String, StructProperties> structTable) {

      StringBuilder sb = new StringBuilder();
      List<Block> functionCFGs = createCFGsSSA(structTable);

      declStrings = getDeclStrings();
      sb.append(declStrings);

      int f = 0;
      int numInstructions = 0;
      for (Block functionEntry : functionCFGs) {
         Function currFunc = funcs.get(f++);
         sb.append(String.format("define %s @%s(", 
                                 currFunc.getRetType().toString(), 
                                 currFunc.getName()));
         for (Declaration decl : currFunc.getParams()) {
            sb.append(String.format("%s %%%s, ", 
                                    decl.getType().toString(),
                                    decl.getName()));
         }
         if (currFunc.getNumParams() > 0) {
            sb.delete(sb.length() - 2, sb.length());
         }
         sb.append(")\n{\n");
         Queue<Block> blockOrder = new LinkedList<>();
         blockOrder = functionEntry.BFS(blockOrder);
         for (Block block : blockOrder) {
            sb.append(block.toString());
            numInstructions += block.getNumInstructions();
         }
         sb.append("}\n\n");
      }
      System.out.println("Num Instructions: " + numInstructions);

      sb.append(utilFuncString);

      return sb.toString();
   }

   public String toStringArm(Map<String, StructProperties> structTable) {
      StringBuilder sb = new StringBuilder();
      List<Block> functionCFGs = createCFGs(structTable);
      int f = 0;
      declStrings = getDeclStringsArm();
      sb.append(declStrings);

      for (Block fEntry : functionCFGs) {
         Function currFunc = funcs.get(f++);
         sb.append("\t\t.align 2\n");
         sb.append("\t\t.global "+currFunc.getName()+"\n");
         sb.append(currFunc.getName()+": \n\n\n");
         if (currFunc.getNumParams() > 0) {
            sb.delete(sb.length() - 2, sb.length());
         }
         Queue<Block> blockOrder = new LinkedList<>();
         blockOrder = fEntry.BFS(blockOrder);
         blockOrder = fEntry.moveExitBlock(blockOrder);
         Block exitBlock = (Block)((LinkedList)blockOrder).getLast();

         Map<String, InterferenceNode> interferenceGraph = createInterferenceGraph(blockOrder, currFunc);

         //Convert graph into more easily used mapping of pseudoregisters to ARM registers
         Map<String, String> registerMappings = new HashMap<>();
         for (Entry<String, InterferenceNode> entry : interferenceGraph.entrySet()) {
            String pseudoRegister = entry.getKey();
            int regNum = entry.getValue().getArmRegister();
            registerMappings.put(pseudoRegister, "r" + Integer.toString(regNum));
         }
         
         for (Block block: blockOrder) {
            sb.append(block.toStringArm(registerMappings));
         }

         sb.append("\t\tpop {r4-r10}\n");
         sb.append("\t\tpop {fp, pc}\n");
         sb.append(String.format("\t\t.size %s, .-%s\n",
                                  currFunc.getName(),
                                  currFunc.getName()));
      }
      return sb.toString();
   }

   private void addPhiInstructions(Block block) {
      Map<String, PhiInstruction> phis = block.getPhis();
      for (Map.Entry<String, PhiInstruction> entry : phis.entrySet()) {
         PhiInstruction phiInstr = entry.getValue();
         String phiRegString = "_phi" + Integer.toString(phiInstr.getPhiNum());
         RegisterValue phiReg = new RegisterValue(phiRegString, new IntType());
         for (ValueLabelPair phiPair : phiInstr.getPhis()) {
            Block foundBlock = findPredWithLabel(block, phiPair.getLabel());
            ArmInstruction move = new ArmMoveInstruction(phiReg, phiPair.getValue());
            foundBlock.addArmPhiMove(move);
         }
      }
   }

   public String toStringSSAArm(Map<String, StructProperties> structTable) {
      StringBuilder sb = new StringBuilder();
      List<Block> functionCFGs = createCFGsSSA(structTable);
      int f = 0;
      declStrings = getDeclStringsArm();
      sb.append(declStrings);
      for (Block fEntry : functionCFGs) {
         Function currFunc = funcs.get(f++);
         sb.append("\t\t.align 2\n");
         sb.append("\t\t.global "+currFunc.getName()+"\n");
         sb.append(currFunc.getName()+": \n\n\n");
         if (currFunc.getNumParams() > 0) {
            sb.delete(sb.length() - 2, sb.length());
         }
         Queue<Block> blockOrder = new LinkedList<>();
         blockOrder = fEntry.BFS(blockOrder);
         blockOrder = fEntry.moveExitBlock(blockOrder);
         Block exitBlock = (Block)((LinkedList)blockOrder).getLast();

         int count = 0;
         for (Block block : blockOrder) {
            addPhiInstructions(block);
         }


         //Create a colored graph
         Map<String, InterferenceNode> interferenceGraph = createInterferenceGraph(blockOrder, currFunc);

         //Convert graph into more easily used mapping of pseudoregisters to ARM registers
         Map<String, String> registerMappings = new HashMap<>();
         for (Entry<String, InterferenceNode> entry : interferenceGraph.entrySet()) {
            String pseudoRegister = entry.getKey();
            int regNum = entry.getValue().getArmRegister();
            registerMappings.put(pseudoRegister, "r" + Integer.toString(regNum));
         }

         for (Block block: blockOrder) {
            sb.append(block.toStringArm(registerMappings));
            //sb.append(block.toStringArm());
         }
         sb.append("\t\tpop {r4-r10}\n");
         sb.append("\t\tpop {fp, pc}\n");
         sb.append(String.format("\t\t.size %s, .-%s\n",
                                  currFunc.getName(),
                                  currFunc.getName()));
      }
      sb.append("\t\t.section\t\t\t.rodata\n");
      sb.append("\t\t.align   2\n");
      return sb.toString();
   }

   private Hashtable<String, InterferenceNode> createInterferenceGraph(Queue<Block> blockOrder, Function currFunc) {
      System.out.println("Generating interference graph");
      Hashtable<String, InterferenceNode> interferenceGraph = new Hashtable<>();
      boolean isFirst = true;
      for (Block block : blockOrder) {
         block.toArmInstructions(isFirst, currFunc);
         isFirst = false;
         System.out.println("Generating gen kill for " + block.getLabel());
         block.generateGenKill();
      }

      generateLiveOuts(blockOrder);
      System.out.println("Entry block live out: " + blockOrder.peek().getLiveOut().toString());

      for (Block block : blockOrder) {
         System.out.println("Adding to intfrnc graph block " + block.getLabel());
         interferenceGraph = addToGraph(block, interferenceGraph);
      }

      Stack<InterferenceNode> nodeStack = new Stack<>();
      InterferenceNode currNode;
      for (Entry<String, InterferenceNode> entry : interferenceGraph.entrySet()) {
         currNode = entry.getValue();

         Set<InterferenceNode> neighbors = currNode.getNeighbors();
         for (InterferenceNode neighbor : neighbors) {
            neighbor.removeNeighbor(currNode);
         }
         nodeStack.push(currNode);
      }
      System.out.println("NODE STACK: " + nodeStack.toString());
      interferenceGraph.clear();

      while (!nodeStack.empty()) {
         currNode = nodeStack.pop();
         // Get colors of all neighbors. Ask Counter class for new color.
         boolean[] neighborColors = new boolean[12];
         System.out.println("Popped: " + currNode.getName());
         System.out.println("Neighbors: "+ currNode.getNeighbors().size());
         for (InterferenceNode neighbor : currNode.getNeighbors()) {
            neighborColors[neighbor.getArmRegister()] = true;
         }
         currNode.setArmRegister(getColor(neighborColors));
         interferenceGraph.put(currNode.getName(), currNode);
      }

      System.out.println("Returning COLORED GRAPH: " + interferenceGraph.toString());

      return interferenceGraph;
   }

   private int getColor(boolean[] neighborColors) {

      for (int i = 4; i < 12; i++) {
         if (!neighborColors[i]) {
            return i;
         }
      }
      System.out.println("UH OH SPILL!!!!!!");

      return -1;
   }

   private Hashtable<String, InterferenceNode> addToGraph(Block block, Hashtable<String, InterferenceNode> graph) {
      
      List<ArmInstruction> armInstrucs = block.getArmInstructions();
      ListIterator instructions = armInstrucs.listIterator(armInstrucs.size());
      Set<Value> live = (Set<Value>)((HashSet)block.getLiveOut()).clone();
      ArmInstruction currInstruc;
      InterferenceNode sourceNode;
      String targetName;
      String liveName;
      
      System.out.println("GRAPH: " + graph.toString());

      while (instructions.hasPrevious()) {
         currInstruc = (ArmInstruction)instructions.previous();
         if (currInstruc == null) {continue;}
         System.out.println(currInstruc.getClass());
         if (currInstruc.toString().equals("null")) { continue; }
         System.out.println("INSTRUC: " + currInstruc.toString());
         Set<Value> currTargets = currInstruc.getTargets();
         for (Value target : currTargets) {
            //Remove all targets
            live.remove(target);
         }
         for (Value target : currTargets) {
            //For each target, add edge from target to each elem of live
            System.out.println(target);
            targetName = target.toStringArm();
            if (!graph.containsKey(targetName)) {
               graph.put(targetName, new InterferenceNode(targetName));
            } 
            InterferenceNode targetNode = graph.get(targetName);
            for (Value val : live) {
               liveName = val.toStringArm();
               if (!graph.containsKey(liveName)) {
                  graph.put(liveName, new InterferenceNode(liveName));
               }
               sourceNode = graph.get(liveName);
               targetNode.addNeighbor(sourceNode);
               sourceNode.addNeighbor(targetNode);
            }
         }
         live.addAll(currInstruc.getSources());
      }

      System.out.println("GRAPH: " + graph.toString());

      return graph;
   }

   private void generateLiveOuts(Queue<Block> blockOrder) {
      Iterator it = ((LinkedList)blockOrder).descendingIterator();

      boolean changed = false;
      while (it.hasNext()) {
         Block currBlock = (Block)it.next();
         System.out.println(currBlock.getLabel());
         //Gen live out for this block and set changed/not
         if (!changed) {
            changed = currBlock.createLiveOut();
         } else {
            currBlock.createLiveOut();
         }
         if ((!it.hasNext()) && changed) {
            it = ((LinkedList)blockOrder).descendingIterator();
            changed = false;
         }
      }

   }

   private Block findPredWithLabel(Block block, String targetLabel) {

      for (Block b : block.getPredecessors()) {
         if (b.getLabel().equals(targetLabel)) {
            return b;
         }
      }

      return null;
   }

   public String toString(Map<String, StructProperties> structTable) {
      StringBuilder sb = new StringBuilder();
      List<Block> functionCFGs = createCFGs(structTable);
      declStrings = getDeclStrings();
      sb.append(declStrings);

      int f = 0;
      int numInstructions = 0;
      for (Block functionEntry : functionCFGs) {
         Function currFunc = funcs.get(f++);
         sb.append(String.format("define %s @%s(", 
                                 currFunc.getRetType().toString(), 
                                 currFunc.getName()));
         for (Declaration decl : currFunc.getParams()) {
            sb.append(String.format("%s %%_P_%s, ", 
                                    decl.getType().toString(),
                                    decl.getName()));
         }
         if (currFunc.getNumParams() > 0) {
            sb.delete(sb.length() - 2, sb.length());
         }
         sb.append(")\n{\n");
         Queue<Block> blockOrder = new LinkedList<>();
         blockOrder = functionEntry.BFS(blockOrder);
         for (Block block : blockOrder) {
            sb.append(block.toString());
            numInstructions += block.getNumInstructions();
         }
         sb.append("}\n\n");
      }
      System.out.println("Num Instructions: " + numInstructions);
      sb.append(utilFuncString);

      return sb.toString();
   }

   private String utilFuncStrings() {
      return ("declare i8* @malloc(i32)\n" + 
              "declare void @printf_int(i32 %x)\n" +
              "declare void @printf_newline(i32 %x)\n" + 
              "declare void @free(i8* %x)\n" +
              "declare i32 @read()\n");
   }

   private String getDeclStrings() {
      StringBuilder sb = new StringBuilder();

      sb.append("target triple=\"i686\"\n");
      for (TypeDeclaration decl : types) {
         sb.append(decl.toString());
      }
      sb.append("\n");

      for (Declaration decl : decls) {
         if (decl.getType() instanceof StructType) {
            sb.append(String.format("@%s = common global %s null, align 4\n",
                     decl.getName(), decl.toString()));
         } else {
            sb.append(String.format("@%s = common global %s 0, align 4\n",
                     decl.getName(), decl.toString()));
         }
      }
      sb.append("\n");
      
      return sb.toString();
   }

   private String getDeclStringsArm() {
      StringBuilder sb = new StringBuilder();
      sb.append("\t\t.arch armv7-a\n");
      for (Declaration decl : decls) {
         sb.append(String.format("\t\t.comm %s,4,4\n", decl.getName()));
      }
      sb.append("\n");
      sb.append("\t\t.text\n");
      return sb.toString();
   }


   public Map<String, StructProperties> typeCheck() {
      Map<String, Map<String, Type>> structTable = new HashMap<>();
      Map<String, StructProperties> cfgStructTable = new HashMap<>();
      boolean mainFlag = false;
      for (Function func : funcs) {
         if (func.getName().equals("main")) {
            mainFlag = true;
         }
      }
      if (!mainFlag) {
         System.out.println("There is no main function");
         System.exit(-1);
      }

      for (TypeDeclaration typeDecl : types) {
         Map<String, Type> fieldMap = new HashMap<>();
         List<String> fieldOrder = new ArrayList<>();

         for (Declaration field : typeDecl.getFields()) {
            fieldMap.put(field.getName(), field.getType());
            fieldOrder.add(field.getName());
         }

         StructProperties currStruct = new StructProperties(typeDecl.getName(),
                                                            fieldMap, fieldOrder);
         cfgStructTable.put(typeDecl.getName(), currStruct);
         structTable.put(typeDecl.getName(), fieldMap);
      }

      for (Function func : funcs) {
         func.typeCheck(symTable, structTable);
         if (!(func.doesReturn() || func.getRetType() instanceof VoidType)) {
            System.out.printf("Function %s is not guaranteed to return\n",
                              func.getName());
            System.exit(-1);
         }
      }

      return cfgStructTable;

   }

   private HashMap<String, IdProperties> initSymTable() {
      HashMap<String, IdProperties> symTable = new HashMap<>();

      for (Declaration currDecl : decls) {
         symTable.put(currDecl.getName(), 
               new IdProperties(currDecl.getType(), true, false, null));
      }

      for (Function func : funcs) {
         symTable.put(func.getName(), 
               new IdProperties(func.getRetType(), false, true, func.getParams()));
      }

      return symTable;
   }

}
