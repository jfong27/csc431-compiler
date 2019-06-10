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

   public Value addInstructionsSSA(Block node, 
                                   Map<String, IdProperties> symTable,
                                   Map<String, StructProperties> structTable) {

      Value leftVal = left.addInstructionsSSA(node, symTable, structTable);
      System.out.println("LEFT: " + left.toString());
      System.out.println("ID: " + id);
      System.out.println(("LEFT VAL: " + leftVal.toString()));
      StructType leftStruct = (StructType)leftVal.getType();
      Map<String, Type> structDef = structTable.get(leftStruct.getName()).getFieldMap();
      int fieldOffset = structTable.get(leftStruct.getName()).getFieldOrder().indexOf(id);
      Type structIdType = structDef.get(id);
      RegisterValue tmpReg = new RegisterValue(structIdType);
      RegisterValue returnReg = new RegisterValue(structIdType);

      node.addInstruction(new GetElemPtrInstruction(tmpReg, leftStruct, 
                                                    leftVal, structIdType, fieldOffset));
      node.addInstruction(new LoadInstruction(returnReg, structIdType, tmpReg, false));
      return returnReg;
   }


   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, StructProperties> structTable) {

      Value leftVal = left.addInstructions(node, symTable, structTable);
      StructType leftStruct = (StructType)leftVal.getType();
      Map<String, Type> structDef = structTable.get(leftStruct.getName()).getFieldMap();
      int fieldOffset = structTable.get(leftStruct.getName()).getFieldOrder().indexOf(id);
      Type structIdType = structDef.get(id);
      RegisterValue tmpReg = new RegisterValue(structIdType);
      RegisterValue returnReg = new RegisterValue(structIdType);

      node.addInstruction(new GetElemPtrInstruction(tmpReg, leftStruct, 
                                                    leftVal, structIdType, fieldOffset));
      node.addInstruction(new LoadInstruction(returnReg, structIdType, tmpReg, false));
      return returnReg;
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
