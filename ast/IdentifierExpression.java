package ast;

import java.util.Map;

public class IdentifierExpression
   extends AbstractExpression
{
   private final String id;

   public IdentifierExpression(int lineNum, String id)
   {
      super(lineNum);
      this.id = id;
   }

   // I think done
   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, Map<String, Type>> structTable) {

      Type idType = symTable.get(id).getType();
      RegisterValue resultReg = new RegisterValue(idType);
      RegisterValue idReg = new RegisterValue(id, idType);

      node.addInstruction(new LoadInstruction(resultReg, idType, idReg));
      return resultReg;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      if (!symTable.containsKey(id)) {
         System.out.println(getLineNum() + ": id '"+id+"' is undeclared");
         System.exit(-1);
      }
      return symTable.get(id).getType();
   }

}
