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
//         if (this.arguments.size() > symTable.get(this.name).getType().getNumParams()) {
//            System.out.println(getLineNum() + ": Too many arguments");
//            System.exit(-1);
//         } else if (this.arguments.size() < symTable.get(this.name).getNumParams()) {
//            System.out.println(getLineNum() + ": Too few arguments");
//            System.exit(-1);
//         }
         return symTable.get(this.name).getType();
      } else {
         System.out.println(getLineNum()+": "+this.name+" is not a struct");
         System.exit(-1);
      }
      System.out.println("yay for line " + getLineNum());
      return new VoidType();
   }

}
