package ast;

import java.util.Map;

public class DotExpression
   extends AbstractExpression
{
   private final Expression left;
   private final String id;

   public DotExpression(int lineNum, Expression left, String id)
   {
      super(lineNum);
      this.left = left;
      this.id = id;
   }

   //TODO: Recurse on left expression, store in register, etc.
   // We need to get the type to give to load instruction. How 
   // do we find out the type? 
   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, Map<String, Type>> structTable) {

      node.addInstruction(new TestInstruction("DOT EXPRESSION"));
      String reg1 = "u" + Integer.toString(Counter.getCount());
      String reg2 = "u" + Integer.toString(Counter.getCount());
      node.addInstruction(new LoadInstruction(new RegisterValue(reg1, new IntType()),
                                              new IntType(), 
                                              new RegisterValue(id, new IntType())));
      node.addInstruction(new GetElemPtrInstruction(new RegisterValue(reg2, new IntType())));
                        
      return new RegisterValue("DOT EXPRESSION", new IntType());
   }


   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      Type leftType = left.typeCheck(symTable, structTable);
      if (!(leftType instanceof StructType)) {
         System.out.printf("%d: Accessing field from non-struct type %s\n",
                           getLineNum(), leftType.getTypeString());
         System.exit(-1);
      }
      String leftName = ((StructType)leftType).getName();
      if (!(structTable.containsKey(leftName))) {
         System.out.printf("%d: There is no struct named '%s'\n",
                            getLineNum(), leftName);
         System.exit(-1);
      }
      if (!((structTable.get(leftName)).containsKey(id))) {
         System.out.printf("%d: %s is not a field of struct '%s'\n",
                            getLineNum(), id, leftName);
         System.exit(-1);
      }
      //Map<String,Type> structFields = structTable.get(leftName);
      return structTable.get(leftName).get(id);
   }
}
