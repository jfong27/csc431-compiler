package ast;

import java.util.Map;

public class ReturnStatement
   extends AbstractStatement
{
   private final Expression expression;

   public ReturnStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {

      Type exprType = expression.typeCheck(symTable, structTable);
      if (exprType.canConvertTo(retType)) {
         return retType;
      } else {
         System.out.printf(getLineNum() + ": Wrong return type: expected %s, returned %s\n",
                            retType.getTypeString(), exprType.getTypeString());
         System.exit(-1);
      }
      return exprType;
   }

   public Block createCFG(Block entryNode, Block exitNode, 
                          Map<String, IdProperties> symTable,
                          Map<String, Map<String, Type>> structTable) {

      //TODO: Add instruction to exitNode
      Value retExpr = expression.addInstructions(entryNode, symTable, structTable);
      // Add a store instruction from retExpr to %ret_val
      entryNode.addInstruction(new UnconditionalBranchInstruction(exitNode.getLabel()));
      if (!exitNode.isFinished()) {
         exitNode.addInstruction(new ReturnInstruction(retExpr.getType(), retExpr));
      }
      entryNode.addSuccessor(exitNode);

      return exitNode;
   }

   public boolean doesReturn() {
      return true;
   }

   public boolean isConditional() {
      return false;
   }
}
