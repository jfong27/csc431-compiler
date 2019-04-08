package ast;

public class FalseExpression
   extends AbstractExpression
{
   public FalseExpression(int lineNum)
   {
      super(lineNum);
   }

   public Type typeCheck() {
      return new BoolType();
   }
}
