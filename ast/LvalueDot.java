package ast;

import java.util.Map;

public class LvalueDot
   implements Lvalue
{
   private final int lineNum;
   private final Expression left;
   private final String id;

   public LvalueDot(int lineNum, Expression left, String id)
   {
      this.lineNum = lineNum;
      this.left = left;
      this.id = id;
   }

   //TODO: Implement
   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      System.out.println("it getsfsdfdsfsfhsdbfjdsbfhsdf");
      return new VoidType();

   }
}
