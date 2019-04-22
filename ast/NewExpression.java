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

   //TODO: determine size to malloc
   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, Map<String, Type>> structTable) {

      RegisterValue mallocResult = new RegisterValue(new PointerType());
      RegisterValue bitcastResult = new RegisterValue(new IntType());
      Type structType = new StructType(id);

      Instruction callInstr = new CallInstruction(mallocResult, new PointerType(), 
                                                  "malloc", new ArrayList<Value>());

      Instruction bitcastInstr = new BitcastInstruction(bitcastResult, mallocResult.getType(),
                                                        mallocResult, structType);
      node.addInstruction(callInstr);
      node.addInstruction(bitcastInstr);
      return bitcastResult;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {

      return new StructType(this.getLineNum(), id);
   }
}
