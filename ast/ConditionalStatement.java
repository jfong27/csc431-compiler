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
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {

      Type guardType = guard.typeCheck(symTable, structTable);

      if (!(guardType instanceof BoolType)) {
         System.out.printf("%d: Conditional statement requires boolean guard, found %s\n",
                           this.getLineNum(), guardType.getTypeString());
         System.exit(-1);
      }

      thenBlock.typeCheck(symTable, structTable, retType);
      elseBlock.typeCheck(symTable, structTable, retType);

      return new BoolType();
   }

   public boolean doesReturn() {
      return (thenBlock.doesReturn() && elseBlock.doesReturn());
   }

}
