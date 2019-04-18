package ast;

import java.util.Map;

public class TrueExpression
   extends AbstractExpression
{
   public TrueExpression(int lineNum)
   {
      super(lineNum);
    }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      return new BoolType();
   }

   //TODO
   public Value addInstructions(Block node) {
      return new RegisterValue("TRUE EXPR");
   }

}
