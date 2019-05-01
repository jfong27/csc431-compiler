package ast;

import java.util.Map;

public class NullExpression
   extends AbstractExpression
{
   public NullExpression(int lineNum)
   {
      super(lineNum);
   }

   public Value addInstructionsSSA(Block node, 
                                   Map<String, IdProperties> symTable,
                                   Map<String, StructProperties> structTable) {
      return new ImmediateValue(-1, new NullType());
   }


   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, StructProperties> structTable) {
      return new ImmediateValue(-1, new NullType());
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      return new VoidType();
   }


}
