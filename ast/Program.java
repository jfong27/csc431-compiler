package ast;

import java.lang.StringBuilder;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Queue;


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
      //this.declStrings = getDeclStrings();
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

      sb.append(declStrings);

      int f = 0;
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
         }
         sb.append("}\n\n");
      }

      sb.append(utilFuncString);

      return sb.toString();
   }

   public String toStringArm(Map<String, StructProperties> structTable) {
      StringBuilder sb = new StringBuilder();
      List<Block> functionCFGs = createCFGs(structTable);
      int f = 0;
      declStrings = getDeclStringsArm();
      sb.append(declStrings);
      boolean isFirst = true;
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

         for (Block block: blockOrder) {
            sb.append(block.toStringArm(isFirst, currFunc));
            isFirst = false;
         }
         isFirst = true;
         sb.append(String.format("\t\t.size %s, .-%s\n",
                                  currFunc.getName(),
                                  currFunc.getName()));
      }
      return sb.toString();
   }

   //TODO: Add ARM phis into predecessors
   public String toStringSSAArm(Map<String, StructProperties> structTable) {
      StringBuilder sb = new StringBuilder();
      List<Block> functionCFGs = createCFGsSSA(structTable);
      int f = 0;
      declStrings = getDeclStringsArm();
      sb.append(declStrings);
      boolean isFirst = true;
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

//         System.out.println("-----------------------_");
//         System.out.println(blockOrder.size());
         int count = 0;
         for (Block block : blockOrder) {
            Map<String, PhiInstruction> phis = block.getPhis();
            for (Map.Entry<String, PhiInstruction> entry : phis.entrySet()) {
               PhiInstruction phiInstr = entry.getValue();
//               System.out.println("Phi Instruction: " + phiInstr.toString());
//               System.out.println("For block " + block.getLabel());
               String phiRegString = "_phi" + Integer.toString(phiInstr.getPhiNum());
               RegisterValue phiReg = new RegisterValue(phiRegString, new IntType());
               for (ValueLabelPair phiPair : phiInstr.getPhis()) {
                  //For each pred, make new ArmMOveInstr and add to it
//                  System.out.println("Pred: ");
//                  System.out.println(phiPair.toString());
                  Block foundBlock = findPredWithLabel(block, phiPair.getLabel());

                  ArmInstruction move = new ArmMoveInstruction(phiReg, phiPair.getValue());
//                  System.out.println(("HEEEY: " + move.toString()));
                  foundBlock.addArmPhiMove(move);
               }
            }
         }

         for (Block block: blockOrder) {
            sb.append(block.toStringArm(isFirst, currFunc));
            isFirst = false;
         }
         isFirst = true;
         sb.append("\t\tpop {fp, pc}\n");
         sb.append(String.format("\t\t.size %s, .-%s\n",
                                  currFunc.getName(),
                                  currFunc.getName()));
      }
      sb.append("\t\t.section\t\t\t.rodata\n");
      sb.append("\t\t.align   2\n");
      return sb.toString();
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
         }
         sb.append("}\n\n");
      }
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
