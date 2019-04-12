package ast;

import java.util.Map;

public class WhileStatement
   extends AbstractStatement
{
   private final Expression guard;
   private final Statement body;

   public WhileStatement(int lineNum, Expression guard, Statement body)
   {
      super(lineNum);
      this.guard = guard;
      this.body = body;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {
      Type guardType = guard.typeCheck(symTable, structTable);
      
      if (!(guardType instanceof BoolType)) {
         System.out.printf("%d: while statement requires bool\n",
                           this.getLineNum());
         System.exit(-1);
      }

      return body.typeCheck(symTable, structTable, retType);
   }

   public boolean doesReturn() {
      return false;
   }
}
