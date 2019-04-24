package ast;

import java.util.Map;

public class WhileStatement
   extends AbstractStatement
{
   private final Expression guard;
   private final Statement body;

   public WhileStatement(int lineNum, Expression guard, Statement body)
   {
      super(lineNum);
      this.guard = guard;
      this.body = body;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {
      Type guardType = guard.typeCheck(symTable, structTable);
      
      if (!(guardType instanceof BoolType)) {
         System.out.printf("%d: while statement requires bool\n",
                           this.getLineNum());
         System.exit(-1);
      }

      return body.typeCheck(symTable, structTable, retType);
   }

   public Block createCFG(Block entryNode, Block exitNode, 
                          Map<String, IdProperties> symTable,
                          Map<String, Map<String, Type>> structTable) {

      Block bodyExit = body.createCFG(entryNode, exitNode, symTable, structTable);
      Block joinBlock = new Block("LU" + Integer.parseInt(Counter.getBlockCount());
      entryNode.addSuccessor(bodyExit);
      entryNode.addSuccessor(joinBlock);
      bodyExit.addSuccessor(bodyExit);
      bodyExit.addSuccessor(joinBlock);

      Value guardVal = guard.addInstructions(entryNode, symTable, structTable);
      Value bodyGuardVal = guard.addInstructions(bodyExit, symTable, structTable);

      //TODO: Problem, we don't have the label for the while body's entry block. 
      // We only have the exit block. 
      //entryNode.addInstruction(new BranchInstruction(guardVal, 
      //bodyExit.addInstruction(new BranchInstruction(bodyGuardVal, 
      

      return joinBlock;
   }

   public boolean doesReturn() {
      return false;
   }

   public boolean isConditional() {
      return false;
   }
}
