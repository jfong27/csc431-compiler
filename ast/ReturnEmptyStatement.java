package ast;

import java.util.Map;

public class ReturnEmptyStatement
   extends AbstractStatement
{
   public ReturnEmptyStatement(int lineNum)
   {
      super(lineNum);
   }

   //TODO: Correct?? Do we even need to return? 
   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      return new VoidType();
   }
}
