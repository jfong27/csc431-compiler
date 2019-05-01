package ast;

import java.util.Map;

public class InvocationStatement
   extends AbstractStatement
{
   private final Expression expression;

   public InvocationStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   public Type typeCheck(Map<String, IdProperties> symTable, 
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {
      return expression.typeCheck(symTable, structTable);
   }

   public Block createCFGSSA(Block entryNode, Block exitNode,
                             Map<String, IdProperties> symTable,
                             Map<String, StructProperties> structTable) {
      expression.addInstructionsSSA(entryNode, symTable, structTable);
      return entryNode;
   }


   public Block createCFG(Block entryNode, Block exitNode,
                          Map<String, IdProperties> symTable,
                          Map<String, StructProperties> structTable) {
      expression.addInstructions(entryNode, symTable, structTable);
      return entryNode;
   }


   public boolean doesReturn() {
      return false;
   }

   public boolean isConditional() {
      return false;
   }
}
