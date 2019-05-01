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

   public Block createCFGSSA(Block entryNode, Block exitNode, 
                             Map<String, IdProperties> symTable,
                             Map<String, StructProperties> structTable) {

      Value retExpr = expression.addInstructionsSSA(entryNode, symTable, structTable);

      RegisterValue retReg = new RegisterValue("_retval_", retExpr.getType());
      entryNode.addInstruction(new StoreInstruction(retExpr.getType(), retExpr.getType(), 
                                                    retExpr, retReg, false));
      entryNode.addInstruction(new UnconditionalBranchInstruction(exitNode.getLabel()));
      if (!exitNode.isFinished()) {
         exitNode.addInstruction(new ReturnInstruction(retExpr.getType(), retExpr));
      }
      entryNode.addSuccessor(exitNode);
      exitNode.addPredecessor(entryNode);

      return exitNode;
   }


   public Block createCFG(Block entryNode, Block exitNode, 
                          Map<String, IdProperties> symTable,
                          Map<String, StructProperties> structTable) {

      Value retExpr = expression.addInstructions(entryNode, symTable, structTable);

      RegisterValue retReg = new RegisterValue("_retval_", retExpr.getType());
      entryNode.addInstruction(new StoreInstruction(retExpr.getType(), retExpr.getType(), 
                                                    retExpr, retReg, false));
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
