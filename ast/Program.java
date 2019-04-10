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

      for (Declaration currDecl : decls) {
         symTable.put(currDecl.getName(), 
                      new IdProperties(currDecl.getType()));
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
      }

   }

}
