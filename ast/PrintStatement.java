package ast;

import java.util.Map;

public class PrintStatement
   extends AbstractStatement
{
   private final Expression expression;

   public PrintStatement(int lineNum, Expression expression)
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

   public Block createCFG(Block entryNode, Block exitNode,
                          Map<String, Map<String, Type>> structTable) {
      //TODO: Add instruction
      
      entryNode.addInstruction(new TestInstruction("PRINT"));
      return entryNode;
   }

   public boolean doesReturn() {
      return false;
   }

   public boolean isConditional() {
      return false;
   }

}
