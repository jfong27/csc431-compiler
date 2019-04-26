package ast;

import java.util.Map;

public class LvalueId
   implements Lvalue
{
   private final int lineNum;
   private final String id;

   public LvalueId(int lineNum, String id)
   {
      this.lineNum = lineNum;
      this.id = id;
   }

   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, StructProperties> structTable) {

      IdProperties idResult = symTable.get(id);
      return new RegisterValue(id, idResult.getType());
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      if (!symTable.containsKey(id)) {
         System.out.println("Variable '"+id+"' is undeclared");
         System.exit(-1);
      }
      return symTable.get(id).getType();
   }

   public String toString() {
      return id;
   }

}
