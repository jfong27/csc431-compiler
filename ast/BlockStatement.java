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

   public List<Statement> getStatements() {
      return statements;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable, 
                         Type retType) {
      for (Statement stmnt : statements) {
         stmnt.typeCheck(symTable, structTable, retType);
      }

      return new BoolType();
   }

   public Block createCFG(Block entryNode, Block exitNode) {
      Block curNode = entryNode;
      for (Statement stmt : statements) {
         curNode = stmt.createCFG(curNode,exitNode);
      }
      return curNode;
   }

   public boolean doesReturn() {
      for (Statement s : statements) {
         if (s.doesReturn())
            return true;
      }
      return false;
   }

   public boolean isConditional() {
      return false;
   }
}
