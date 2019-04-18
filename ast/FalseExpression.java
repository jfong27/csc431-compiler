package ast;

import java.util.Map;

public class FalseExpression
   extends AbstractExpression
{
   public FalseExpression(int lineNum)
   {
      super(lineNum);
   }

   //TODO: IMPLEMENT
   public Value addInstructions(Block node) {
      return new RegisterValue("FALSE EXPRESSION");
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      return new BoolType();
   }
}
