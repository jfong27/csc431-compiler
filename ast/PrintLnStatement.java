package ast;

import java.util.Map;

public class PrintLnStatement
   extends AbstractStatement
{
   private final Expression expression;

   public PrintLnStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {

      expression.typeCheck(symTable, structTable);

      return new VoidType();
   }

   public Block createCFG(Block entryNode, Block exitNode) {
      //TODO: Add instruction to entry node

      return entryNode;
   }

   public boolean doesReturn() {
      return false;
   }

   public boolean isConditional() {
      return false;
   }

}
