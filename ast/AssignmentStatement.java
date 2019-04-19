package ast;

import java.util.Map;

public class AssignmentStatement
   extends AbstractStatement
{
   private final Lvalue target;
   private final Expression source;

   public AssignmentStatement(int lineNum, Lvalue target, Expression source)
   {
      super(lineNum);
      this.target = target;
      this.source = source;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {

      Type lValueType = target.typeCheck(symTable, structTable);
      Type sourceType = source.typeCheck(symTable, structTable);

      if (!sourceType.canConvertTo(lValueType)) {
         System.out.println(getLineNum() + ": cannot assign "+sourceType.getTypeString()+
                            " to "+lValueType.getTypeString());
         System.exit(-1);
      } 

      return sourceType;

   }

   public Block createCFG(Block entryNode, Block exitNode) {
      Value sourceReg = source.addInstructions(entryNode);
      Value targetReg = target.addInstructions(entryNode);
      StoreInstruction instr = new StoreInstruction(new IntType(), new IntType(), 
                                                    sourceReg, targetReg);
      entryNode.addInstruction(instr);
      return entryNode;
   }

   public boolean doesReturn() {
      return false;
   }

   public boolean isConditional() {
      return false;
   }

}
