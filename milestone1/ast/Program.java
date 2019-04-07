package ast;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

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
      Map<String, IdProperties> symTable = new HashMap<>();

      for (Declaration currDecl : decls) {
         symTable.put(currDecl.getName(), 
                      new IdProperties(currDecl.getType()));
      }

      /*
      for (TypeDeclaration typeDecl : types) {
         symTable.put(typeDecl.getName(),
                      new IdProperties(typeDecl.
      }*/

      for (Function func : funcs) {
         func.typeCheck();
      }

   }

}
