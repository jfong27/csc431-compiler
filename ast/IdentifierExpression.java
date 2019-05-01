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

   public Value addInstructionsSSA(Block node, 
                                   Map<String, IdProperties> symTable,
                                   Map<String, StructProperties> structTable) {

      Type idType = symTable.get(id).getType();

      return readVariable(id, idType, node);
   }

   private Value readVariable(String variable, Type type, Block block) {

      Map<String, Value> idMap = block.getIdMap();
      if (idMap.containsKey(id)) {
         return idMap.get(id);
      }
      return readVariableFromPredecessors(id, idType, node);
   }

   private Value readVariableFromPredecessors(String variable, Type type, Block block) {
      if (!block.isSealed()) {
         RegisterValue resultReg = new RegisterValue(type);
         PhiInstruction phiInstr = new PhiInstruction(resultReg, type);
         block.addPhi(phiInstr);
         return resultReg;
      } else if (block.numPredecessors() == 0) {
         //TODO: Return actual value of the variable
         return new ImmediateValue(-1, new NullType());
      } else if (block.numPredecessors() == 1) {
         return readVariable(variable, type, block.getPredecessors().get(0));
      } else {
         RegisterValue resultReg = new RegisterValue(type);
         PhiInstruction phiInstr = new PhiInstruction(resultReg, type);
         block.addPhi(phiInstr);
         return resultReg;
      } 
   }

   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, StructProperties> structTable) {

      Type idType = symTable.get(id).getType();
      RegisterValue resultReg = new RegisterValue(idType);
      RegisterValue idReg = new RegisterValue(id, idType);

      node.addInstruction(new LoadInstruction(resultReg, idType,
                                              idReg, symTable.get(id).isGlobal()));
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
