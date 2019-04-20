package ast;

import java.util.Map;

public class ReturnEmptyStatement
   extends AbstractStatement
{
   public ReturnEmptyStatement(int lineNum)
   {
      super(lineNum);
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {
      if (!(retType instanceof VoidType)) {
         System.out.println(getLineNum() + ": expected to return " + retType.getTypeString() +
                            " but returned nothing");
         System.exit(-1);
      }
      return new VoidType();
   }

   // I tihnk done
   public Block createCFG(Block entryNode, Block exitNode,
                          Map<String, IdProperties> symTable,
                          Map<String, Map<String, Type>> structTable) {
      entryNode.addSuccessor(exitNode);
      entryNode.addInstruction(new UnconditionalBranchInstruction(exitNode.getLabel()));
      exitNode.addInstruction(new ReturnEmptyInstruction());
      
      return exitNode; 
   }

   public boolean doesReturn() {
      return true;
   }

   public boolean isConditional() {
      return false;
   }

}
