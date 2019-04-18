package ast;

import java.util.Map;

public class ReadExpression
   extends AbstractExpression
{
   public ReadExpression(int lineNum)
   {
      super(lineNum);
   }

   //TODO
   public Value addInstructions(Block node) {
      return new RegisterValue("READ EXPR");
   }

   //TODO: IMPLEMENT
   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      return new IntType();
   }

}
