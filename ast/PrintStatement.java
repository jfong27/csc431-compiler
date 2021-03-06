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

   public Block createCFGSSA(Block entryNode, Block exitNode,
                             Map<String, IdProperties> symTable,
                             Map<String, StructProperties> structTable) {

      Value resultVal = expression.addInstructionsSSA(entryNode, symTable, structTable);
      
      entryNode.addInstruction(new PrintInstruction(resultVal));

      return entryNode;
   }


   public Block createCFG(Block entryNode, Block exitNode,
                          Map<String, IdProperties> symTable,
                          Map<String, StructProperties> structTable,
                          Type retType) {
      Value resultVal = expression.addInstructions(entryNode, symTable, structTable);
      
      entryNode.addInstruction(new PrintInstruction(resultVal));
      return entryNode;
   }

   public boolean doesReturn() {
      return false;
   }

   public boolean isConditional() {
      return false;
   }

}
