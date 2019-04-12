package ast;

import java.util.Map;
import java.util.List;

public class InvocationExpression
   extends AbstractExpression
{
   private final String name;
   private final List<Expression> arguments;

   public InvocationExpression(int lineNum, String name,
      List<Expression> arguments)
   {
      super(lineNum);
      this.name = name;
      this.arguments = arguments;
   }

   //TODO: IMPLEMENT
   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {

      if (symTable.containsKey(this.name) && 
          symTable.get(this.name).isFunction()) {
        // System.out.printf("%d: %s is a function\n", this.getLineNum(), this.name);
         return symTable.get(this.name).getType();
      } else {
         System.out.println(this.name+" is not a struct");
      }
      return new VoidType();
   }

}
