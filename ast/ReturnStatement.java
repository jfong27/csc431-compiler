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
      if (exprType.canConvertTo(retType)) {
         return retType;
      } else {
         System.out.printf(getLineNum() + ": Wrong return type: expected %s, returned %s\n",
                            retType.getTypeString(), exprType.getTypeString());
         System.exit(-1);
      }
      return exprType;
   }

}
