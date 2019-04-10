package ast;

import java.util.Map;
import java.util.List;

public class InvocationExpression
   extends AbstractExpression
{
   private final String name;
   private final List<Expression> arguments;

   public InvocationExpression(int lineNum, String name,
      List<Expression> arguments)
   {
      super(lineNum);
      this.name = name;
      this.arguments = arguments;
   }

   //TODO: IMPLEMENT
   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      return new VoidType();
   }

}
