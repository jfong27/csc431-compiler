package ast;

import java.util.Map;

public class WhileStatement
   extends AbstractStatement
{
   private final Expression guard;
   private final Statement body;
   private static int whileCount = 0;

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

   public Block createCFG(Block entryNode, Block exitNode) {
      //entryNode.addInstructions(guard);
      Block bodyExit = body.createCFG(entryNode, exitNode);
      Block joinBlock = new Block("join"+whileCount);
      whileCount++;
      entryNode.addSuccessor(bodyExit);
      entryNode.addSuccessor(joinBlock);
      bodyExit.addSuccessor(bodyExit);
      bodyExit.addSuccessor(joinBlock);
      return joinBlock;
   }

   public boolean doesReturn() {
      return false;
   }

   public boolean isConditional() {
      return false;
   }
}
