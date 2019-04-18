package ast;

import java.util.Map;

public class IntegerExpression
   extends AbstractExpression
{
   private final String value;

   public IntegerExpression(int lineNum, String value)
   {
      super(lineNum);
      this.value = value;
   }
   
   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      return new IntType();
   }

   public Value addInstructions(Block node) {
      return new ImmediateValue(0);
   }
}
