package ast;

import java.util.*;

public class TrueExpression
   extends AbstractExpression
{
   public TrueExpression(int lineNum)
   {
      super(lineNum);
   }

   public Type typeCheck() {
      return new BoolType();
   }
}
