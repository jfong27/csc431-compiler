package ast;

import java.util.Map;

public class ConditionalStatement
   extends AbstractStatement
{
   private final Expression guard;
   private final Statement thenBlock;
   private final Statement elseBlock;
   private static int condCount = 0;

   public ConditionalStatement(int lineNum, Expression guard,
      Statement thenBlock, Statement elseBlock)
   {
      super(lineNum);
      this.guard = guard;
      this.thenBlock = thenBlock;
      this.elseBlock = elseBlock;
   }

   public Block createCFG(Block entryNode, Block exitNode) {
      Block thenEntry = new Block("thenEntry" + condCount);
      Block elseEntry = new Block("elseEntry" + condCount);
      Block joinEntry = new Block("joinEntry" + condCount);
      condCount++;
      Block thenExit = thenBlock.createCFG(thenEntry, exitNode);
      Block elseExit = elseBlock.createCFG(elseEntry, exitNode);
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
