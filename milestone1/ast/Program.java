package ast;

import java.util.*;

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
      for (int i = 0; i < decls.size(); i++) {
          System.out.println("it is typechecking all global decls");
          decls.get(i).typeCheck();
      }
      //TODO: Add all declarations to symbol table

   }
}
