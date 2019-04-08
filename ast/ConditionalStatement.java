package ast;

import java.util.Map;

public class ConditionalStatement
   extends AbstractStatement
{
   private final Expression guard;
   private final Statement thenBlock;
   private final Statement elseBlock;

   public ConditionalStatement(int lineNum, Expression guard,
      Statement thenBlock, Statement elseBlock)
   {
      super(lineNum);
      this.guard = guard;
      this.thenBlock = thenBlock;
      this.elseBlock = elseBlock;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      if !(guard.typeCheck(symTable, structTable).equals(new BoolType())) {
         System.out.println("conditional requires boolean guard");
         System.exit(-1);
      }

      thenBlock.typeCheck(symTable, structTable);
      elseBlock.typeCheck(symTable, structTable);

      return new BoolType();
   }

}
