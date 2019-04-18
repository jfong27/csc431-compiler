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

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      return symTable.get(id).getType();

   }

   public String toString() {
      return id;
   }

}
