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

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      if (!symTable.containsKey(id)) {
         System.out.println("id '"+id+"' does not exist");
         System.exit(-1);
      }
      return symTable.get(id).getType();
   }

}
