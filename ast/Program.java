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

   public Program(List<TypeDeclaration> types, List<Declaration> decls,
      List<Function> funcs)
   {
      this.types = types;
      this.decls = decls;
      this.funcs = funcs;
      this.symTable = initSymTable();
   }

   public List<Block> createCFGraphs(Map<String, Map<String, Type>> structTable) {

      ArrayList<Block> funcGraphs = new ArrayList<>();

      for (Function func : funcs) {
         funcGraphs.add(func.createCFG(symTable, structTable));
      }

      return funcGraphs;

   }

   public String toString(Map<String, Map<String, Type>> structTable) {
      StringBuilder sb = new StringBuilder();
      List<Block> functionCFGs = createCFGraphs(structTable);

      sb.append("target triple=\"i686\"");
      for (TypeDeclaration decl : types) {
         sb.append(decl.toString());
      }
      sb.append("\n");

      int f = 0;
      for (Block functionEntry : functionCFGs) {
         Function currFunc = funcs.get(f++);
         sb.append(String.format("define %s @%s()\n{\n", 
                                 currFunc.getRetType().toString(), 
                                 currFunc.getName()));
         Queue<Block> blockOrder = new LinkedList<>();
         blockOrder = functionEntry.BFS(blockOrder);
         for (Block block : blockOrder) {
            sb.append(block.toString());
         }
         sb.append("}\n\n");
      }

      return sb.toString();
   }


   public Map<String, Map<String, Type>> typeCheck() {
      Map<String, Map<String, Type>> structTable = new HashMap<>();
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
         Map<String, Type> fieldsTable = new HashMap<>();

         for (Declaration field : typeDecl.getFields()) {
            fieldsTable.put(field.getName(), field.getType());
         }

         structTable.put(typeDecl.getName(), fieldsTable);
      }

      for (Function func : funcs) {
         func.typeCheck(symTable, structTable);
         if (!(func.doesReturn() || func.getRetType() instanceof VoidType)) {
            System.out.printf("Function %s is not guaranteed to return\n",
                              func.getName());
            System.exit(-1);
         }
      }

      return structTable;

   }

   private HashMap<String, IdProperties> initSymTable() {
      HashMap<String, IdProperties> symTable = new HashMap<>();

      for (Declaration currDecl : decls) {
         symTable.put(currDecl.getName(), 
               new IdProperties(currDecl.getType(), false, null));
      }

      for (Function func : funcs) {
         symTable.put(func.getName(), 
               new IdProperties(func.getRetType(), true, func.getParams()));
      }

      return symTable;
   }

}
