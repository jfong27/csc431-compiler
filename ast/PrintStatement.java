package ast;

import java.util.Map;

public class PrintStatement
   extends AbstractStatement
{
   private final Expression expression;

   public PrintStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   //TODO: Correct to return voidType???
   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {
      expression.typeCheck(symTable, structTable);

      return new VoidType();
   }

   public boolean doesReturn() {
      return false;
   }

}
