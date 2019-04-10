package ast;

import java.util.Map;

public class NullExpression
   extends AbstractExpression
{
   public NullExpression(int lineNum)
   {
      super(lineNum);
   }

   //TODO: Correct to return void type???
   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      return new VoidType();
   }

}
