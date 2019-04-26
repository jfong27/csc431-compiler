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

   // Logically good? Probably bugs
   public Block createCFG(Block entryNode, Block exitNode,
                          Map<String, IdProperties> symTable,
                          Map<String, StructProperties> structTable) {

      Value resultVal = expression.addInstructions(entryNode, symTable, structTable);

      List<Value> args = new ArrayList<>();
      args.add(resultVal);
      CallInstruction callInstr = new CallInstruction(new VoidType(), "free", args);
                                                       
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
