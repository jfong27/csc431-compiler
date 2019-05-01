package ast;

import java.util.List;
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

   public Value addInstructionsSSA(Block node, 
                                   Map<String, IdProperties> symTable,
                                   Map<String, StructProperties> structTable) {

      Value leftVal = left.addInstructionsSSA(node, symTable, structTable);
      StructType leftStruct = (StructType)leftVal.getType();
      Type structIdType = structTable.get(leftStruct.getName()).getFieldMap().get(id);
      List<String> fieldOrder = structTable.get(leftStruct.getName()).getFieldOrder();
      RegisterValue tmpReg = new RegisterValue(structIdType);

      node.addInstruction(new GetElemPtrInstruction(tmpReg, leftStruct, 
                                                    leftVal, structIdType, fieldOrder.indexOf(id)));
      return tmpReg;
   }

   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, StructProperties> structTable) {
      Value leftVal = left.addInstructions(node, symTable, structTable);
      StructType leftStruct = (StructType)leftVal.getType();
      Type structIdType = structTable.get(leftStruct.getName()).getFieldMap().get(id);
      List<String> fieldOrder = structTable.get(leftStruct.getName()).getFieldOrder();
      RegisterValue tmpReg = new RegisterValue(structIdType);

      node.addInstruction(new GetElemPtrInstruction(tmpReg, leftStruct, 
                                                    leftVal, structIdType, fieldOrder.indexOf(id)));
      return tmpReg;
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
