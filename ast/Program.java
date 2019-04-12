package ast;

import java.util.List;
import java.util.Map;
import java.util.HashMap;


public class Program
{
   private final List<TypeDeclaration> types;
   private final List<Declaration> decls;
   private final List<Function> funcs;

   public Program(List<TypeDeclaration> types, List<Declaration> decls,
      List<Function> funcs)
   {
      this.types = types;
      this.decls = decls;
      this.funcs = funcs;
   }

   public void typeCheck() {
      HashMap<String, IdProperties> symTable = new HashMap<>();
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
      for (Declaration currDecl : decls) {
         symTable.put(currDecl.getName(), 
                      new IdProperties(currDecl.getType(), false, null));
      }

      for (TypeDeclaration typeDecl : types) {
         Map<String, Type> fieldsTable = new HashMap<>();

         for (Declaration field : typeDecl.getFields()) {
            fieldsTable.put(field.getName(), field.getType());
         }

         structTable.put(typeDecl.getName(), fieldsTable);
      }

      //TODO: Invocation expression needs to return the retType of
      // the function being invoked. So we need to add function retTypes
      // to the symTable?? 
      for (Function func : funcs) {
         symTable.put(func.getName(), 
                      new IdProperties(func.getRetType(), true, func.getParams()));
      }

      for (Function func : funcs) {
         func.typeCheck(symTable, structTable);
         if (!func.doesReturn()) {
            System.out.printf("Function %s is not guaranteed to return\n",
                              func.getName());
            System.exit(-1);
         }
      }

   }

}
