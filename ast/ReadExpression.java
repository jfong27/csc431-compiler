package ast;

import java.util.Map;

public class ReadExpression
   extends AbstractExpression
{
   public ReadExpression(int lineNum)
   {
      super(lineNum);
   }

   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, Map<String, Type>> structTable) {
      RegisterValue resultReg = new RegisterValue(new IntType());
      node.addInstruction(new ReadInstruction(resultReg));

      return resultReg;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      return new IntType();
   }
}
