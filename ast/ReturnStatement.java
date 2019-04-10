package ast;

import java.util.Map;

public class ReturnStatement
   extends AbstractStatement
{
   private final Expression expression;

   public ReturnStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {
      Type exprType = expression.typeCheck(symTable, structTable);
      if (exprType.equals(retType)) {
         return retType;
      } else {
         System.out.println("wrong return type");
         System.exit(-1);
      }

   }
}
