package ast;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DeleteStatement
   extends AbstractStatement
{
   private final Expression expression;

   public DeleteStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {

      Type exprType = expression.typeCheck(symTable, structTable);

      return retType;

   }

   public Block createCFGSSA(Block entryNode, Block exitNode,
                             Map<String, IdProperties> symTable,
                             Map<String, StructProperties> structTable) {

      return entryNode;

   }

   public Block createCFG(Block entryNode, Block exitNode,
                          Map<String, IdProperties> symTable,
                          Map<String, StructProperties> structTable) {

      Value resultVal = expression.addInstructions(entryNode, symTable, structTable);

      List<Value> args = new ArrayList<>();
      RegisterValue bitcastResult = new RegisterValue(new StructPointerType());
      BitcastInstruction bitcastInstr = new BitcastInstruction(bitcastResult, resultVal.getType(),
                                                               resultVal, new StructPointerType());
      args.add(bitcastResult);
      CallInstruction callInstr = new CallInstruction(new VoidType(), "free", args);
                                                       
      entryNode.addInstruction(bitcastInstr);
      entryNode.addInstruction(callInstr);
      
      return entryNode;
   }

   public boolean doesReturn() {
      return false;
   }

   public boolean isConditional() {
      return false;
   }

}
