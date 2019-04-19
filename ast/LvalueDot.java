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


   public Value addInstructions(Block node) {
      node.addInstruction(new TestInstruction("ADD INSTR FOR LVALUEDOT"));
      return new RegisterValue("LVALUE DOT");
   }


   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      Type leftType = left.typeCheck(symTable, structTable);
      if (!(leftType instanceof StructType)) {
         System.out.printf("%d: Accessing field from a non-struct type\n",
                           lineNum);
         System.exit(-1);
      }
      String leftName = ((StructType)leftType).getName();
      if (!(structTable.containsKey(leftName))) {
         System.out.printf("%d: There is no struct named '%s'\n",
                            lineNum, leftName);
         System.exit(-1);
      }
      if (!((structTable.get(leftName)).containsKey(id))) {
         System.out.printf("%d: %s is not a field of struct '%s'\n",
                            lineNum, id, leftName);
         System.exit(-1);
      }
      return structTable.get(leftName).get(id);

   }

   public String toString() {
      return "IMPLEMENT LVALUE DOT TOSTRING";
   }
}
