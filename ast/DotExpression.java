package ast;

import java.util.Map;

public class DotExpression
   extends AbstractExpression
{
   private final Expression left;
   private final String id;

   public DotExpression(int lineNum, Expression left, String id)
   {
      super(lineNum);
      this.left = left;
      this.id = id;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {

      Type leftType = left.typeCheck(symTable, structTable); 
      if (!(leftType instanceof StructType)) {
         System.out.println("Accessing field of field that isn't struct");
         System.exit(-1);
      }

      Map<String,Type> structFields = structTable.get(((StructType)leftType).getName());

      return structFields.get(id);
      
   }

}
