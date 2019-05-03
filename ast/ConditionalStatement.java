package ast;

import java.util.Map;

public class ConditionalStatement
   extends AbstractStatement
{
   private final Expression guard;
   private final Statement thenBlock;
   private final Statement elseBlock;
 //  private static int condCount = 0;

   public ConditionalStatement(int lineNum, Expression guard,
      Statement thenBlock, Statement elseBlock)
   {
      super(lineNum);
      this.guard = guard;
      this.thenBlock = thenBlock;
      this.elseBlock = elseBlock;
   }

   //TODO
   public Block createCFGSSA(Block entryNode, Block exitNode,
                             Map<String, IdProperties> symTable,
                             Map<String, StructProperties> structTable) {
      Block thenEntry = new Block("LU" + Counter.getBlockCount());
      Block elseEntry = new Block("LU" + Counter.getBlockCount());
      Block joinEntry = new Block("LU" + Counter.getBlockCount());

      thenEntry.seal();
      elseEntry.seal();

      entryNode.addSuccessor(thenEntry);
      entryNode.addSuccessor(elseEntry);
      thenEntry.addPredecessor(entryNode);
      elseEntry.addPredecessor(entryNode);

      RegisterValue guardResult = (RegisterValue)guard.addInstructionsSSA(entryNode, symTable, structTable);
      Value res = new RegisterValue(new BoolType());
      entryNode.addInstruction(new TruncInstruction(res, guardResult));
      entryNode.addInstruction(new BranchInstruction(res,
                                                     thenEntry.getLabel(), 
                                                     elseEntry.getLabel()));

      Block thenExit = thenBlock.createCFGSSA(thenEntry, exitNode, 
                                              symTable, structTable);
      Block elseExit = elseBlock.createCFGSSA(elseEntry, exitNode,
                                              symTable, structTable);

      if (!thenExit.isFinished()) {
         thenExit.addInstruction(new UnconditionalBranchInstruction(joinEntry.getLabel()));
      }
      if (!elseExit.isFinished()) {
         elseExit.addInstruction(new UnconditionalBranchInstruction(joinEntry.getLabel()));
      }

      thenExit.addSuccessor(joinEntry);
      elseExit.addSuccessor(joinEntry);
      joinEntry.addPredecessor(thenExit);
      joinEntry.addPredecessor(elseExit);
      joinEntry.seal();

      return joinEntry;
   }

   public Block createCFG(Block entryNode, Block exitNode,
                          Map<String, IdProperties> symTable,
                          Map<String, StructProperties> structTable,
                          Type retType) {

      Block thenEntry = new Block("LU" + Counter.getBlockCount());
      Block elseEntry = new Block("LU" + Counter.getBlockCount());
      Block joinEntry = new Block("LU" + Counter.getBlockCount());

      entryNode.addSuccessor(thenEntry);
      entryNode.addSuccessor(elseEntry);
      thenEntry.addPredecessor(entryNode);
      elseEntry.addPredecessor(entryNode);
      
      
      Value guardResult = guard.addInstructions(entryNode, symTable, structTable);
      Value res = new RegisterValue(new BoolType());
      entryNode.addInstruction(new TruncInstruction(res, guardResult));
      entryNode.addInstruction(new BranchInstruction(res, //originally guardResult
                                                     thenEntry.getLabel(), 
                                                     elseEntry.getLabel()));

      Block thenExit = thenBlock.createCFG(thenEntry, exitNode, 
                                           symTable, structTable, retType);
      Block elseExit = elseBlock.createCFG(elseEntry, exitNode,
                                           symTable, structTable, retType);

      if (!thenExit.isFinished()) {
         thenExit.addInstruction(new UnconditionalBranchInstruction(joinEntry.getLabel()));
      }
      if (!elseExit.isFinished()) {
         elseExit.addInstruction(new UnconditionalBranchInstruction(joinEntry.getLabel()));
      }

      thenExit.addSuccessor(joinEntry);
      elseExit.addSuccessor(joinEntry);

      return joinEntry;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {

      Type guardType = guard.typeCheck(symTable, structTable);

      if (!(guardType instanceof BoolType)) {
         System.out.printf("%d: Conditional statement requires boolean guard, found %s\n",
                           this.getLineNum(), guardType.getTypeString());
         System.exit(-1);
      }

      thenBlock.typeCheck(symTable, structTable, retType);
      elseBlock.typeCheck(symTable, structTable, retType);

      return new BoolType();
   }

   public boolean doesReturn() {
      return (thenBlock.doesReturn() && elseBlock.doesReturn());
   }

   public boolean isConditional() {
      return true;
   }

}
