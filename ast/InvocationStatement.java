package ast;

import java.util.Map;

public class InvocationStatement
   extends AbstractStatement
{
   private final Expression expression;

   public InvocationStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   //TODO: IMPLEMENT
   public Type typeCheck(Map<String, IdProperties> symTable, 
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {
      return new VoidType();
   }
}
