package ast;

import java.util.Map;

public class DeleteStatement
   extends AbstractStatement
{
   private final Expression expression;

   public DeleteStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {

      Type exprType = expression.typeCheck(symTable, structTable);

      return retType;

   }

   public boolean doesReturn() {
      return false;
   }

   public boolean isConditional() {
      return false;
   }

}
