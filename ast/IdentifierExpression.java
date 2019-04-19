package ast;

import java.util.Map;

public class IdentifierExpression
   extends AbstractExpression
{
   private final String id;

   public IdentifierExpression(int lineNum, String id)
   {
      super(lineNum);
      this.id = id;
   }

   //TODO: IMPLEMENT
   public Value addInstructions(Block node) {
      node.addInstruction(new TestInstruction("ID EXPRESSION"));
      return new RegisterValue("ID EXPRESSION");
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      if (!symTable.containsKey(id)) {
         System.out.println(getLineNum() + ": id '"+id+"' is undeclared");
         System.exit(-1);
      }
      return symTable.get(id).getType();
   }

}
