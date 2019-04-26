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

   public List<Block> createCFGraphs(Map<String, StructProperties> structTable) {

      ArrayList<Block> funcGraphs = new ArrayList<>();

      for (Function func : funcs) {
         funcGraphs.add(func.createCFG(symTable, structTable));
      }

      return funcGraphs;

   }

   public String toString(Map<String, StructProperties> structTable) {
      StringBuilder sb = new StringBuilder();
      List<Block> functionCFGs = createCFGraphs(structTable);

      sb.append("target triple=\"i686\"\n");
      for (TypeDeclaration decl : types) {
         sb.append(decl.toString());
      }
      sb.append("\n");

      for (Declaration decl : decls) {
         sb.append(String.format("@%s = common global %s null, align 4\n",
                                  decl.getName(), decl.toString()));
      }
      sb.append("\n");

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
      sb.append("declare i8* @malloc(i32)\n");
      sb.append("declare void @printf_int(i32 %x)\n");
      sb.append("declare void @printf_newline(i32 %x)\n");
      sb.append("declare void @free(i8* %x)\n");
      sb.append("declare i32 @read()\n");

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
               new IdProperties(currDecl.getType(), false, null));
      }

      for (Function func : funcs) {
         symTable.put(func.getName(), 
               new IdProperties(func.getRetType(), true, func.getParams()));
      }

      return symTable;
   }

}
