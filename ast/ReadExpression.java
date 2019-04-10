package ast;

import java.util.Map;

public class ReadExpression
   extends AbstractExpression
{
   public ReadExpression(int lineNum)
   {
      super(lineNum);
   }

   //TODO: IMPLEMENT
   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      return new VoidType();
   }

}
