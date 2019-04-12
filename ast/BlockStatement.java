package ast;

import java.util.Map;
import java.util.List;
import java.util.ArrayList;

public class BlockStatement
   extends AbstractStatement
{
   private final List<Statement> statements;

   public BlockStatement(int lineNum, List<Statement> statements)
   {
      super(lineNum);
      this.statements = statements;
   }

   public static BlockStatement emptyBlock()
   {
      return new BlockStatement(-1, new ArrayList<>());
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable, 
                         Type retType) {
      for (Statement stmnt : statements) {
         stmnt.typeCheck(symTable, structTable, retType);
      }

      //TODO: Should statements return a type? 
      //Consider return statements
      return new BoolType();
   }

   public boolean doesReturn() {
      for (Statement s : statements) {
         if (s.doesReturn())
            return true;
      }
      return false;
   }
}
