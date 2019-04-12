package ast;

import java.util.Map;

public class ReturnEmptyStatement
   extends AbstractStatement
{
   public ReturnEmptyStatement(int lineNum)
   {
      super(lineNum);
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {

      if (retType instanceof VoidType) {
         return new VoidType();
      } 
      System.out.printf("%d: Expected return type of %s, found void\n",
                        this.getLineNum(), retType.getTypeString());
      System.exit(-1);
      return new VoidType();
   }
}
