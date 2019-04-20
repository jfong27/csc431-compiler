package ast;

import java.util.ArrayList;
import java.util.Map;

public class NewExpression
   extends AbstractExpression
{
   private final String id;

   public NewExpression(int lineNum, String id)
   {
      super(lineNum);
      this.id = id;
   }

   //TODO
   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, Map<String, Type>> structTable) {

      RegisterValue result1 = new RegisterValue("u" + Integer.toString(Counter.getCount()),
                                                new IntType());
      Instruction callInstr = new CallInstruction(result1, new IntType(), "malloc", new ArrayList<Value>());

      RegisterValue result2 = new RegisterValue("u" + Integer.toString(Counter.getCount()),
                                                new IntType());
      Instruction bitcastInstr = new BitcastInstruction(result2, result1);
      node.addInstruction(callInstr);
      node.addInstruction(bitcastInstr);
      return result2;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {

      return new StructType(this.getLineNum(), id);
   }
}
