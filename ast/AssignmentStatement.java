package ast;

import java.util.*;

public class AssignmentStatement
   extends AbstractStatement
{
   private final Lvalue target;
   private final Expression source;

   public AssignmentStatement(int lineNum, Lvalue target, Expression source)
   {
      super(lineNum);
      this.target = target;
      this.source = source;
   }

   public Type typeCheck(Map<String, IdProperties> symTable) {
      Type lValueType = target.typeCheck(symTable);
      Type sourceType = source.typeCheck(symTable);

      if (!sourceType.canConvertTo(lValueType)) {
         System.out.println("Assignment statement error");
         System.exit(-1);
      } 

      return sourceType;

   }

}
