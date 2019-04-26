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
                          Map<String, StructProperties> structTable) {
      Block bodyEntry = new Block("LU" + Integer.toString(Counter.getBlockCount()));
      Block joinBlock = new Block("LU" + Integer.toString(Counter.getBlockCount()));
      entryNode.addSuccessor(bodyEntry);
      entryNode.addSuccessor(joinBlock);
      Value guardVal = guard.addInstructions(entryNode, symTable, structTable);
      Value truncatedGuard = new RegisterValue(new BoolType());
      entryNode.addInstruction(new TruncInstruction(truncatedGuard, guardVal));
      entryNode.addInstruction(new BranchInstruction(truncatedGuard,
                                                     bodyEntry.getLabel(),
                                                     joinBlock.getLabel()));
      Block bodyExit = body.createCFG(bodyEntry, exitNode,
                                      symTable, structTable);
      Value bodyGuardVal = guard.addInstructions(bodyExit, symTable, structTable);
      Value truncatedBodyGuard = new RegisterValue(new BoolType());
      bodyExit.addSuccessor(joinBlock);
      bodyExit.addInstruction(new TruncInstruction(truncatedBodyGuard, bodyGuardVal));
      bodyExit.addInstruction(new BranchInstruction(truncatedBodyGuard,
                                                    bodyEntry.getLabel(),
                                                    joinBlock.getLabel()));
      if (!bodyExit.isFinished()) {
         bodyExit.addInstruction(new UnconditionalBranchInstruction(joinBlock.getLabel()));
      }
      bodyExit.addSuccessor(bodyEntry);
      return joinBlock;
   }

   public boolean doesReturn() {
      return false;
   }

   public boolean isConditional() {
      return false;
   }
}
