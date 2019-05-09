package ast;

import java.util.Iterator;
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
      Value idVal = readVariable(id, idType, node);
      node.updateMap(id, idVal);
      return idVal;
   }

   private void writeVariable(String variable, Value value, Block block) {
      block.updateMap(variable, value);
   }

   private Value readVariable(String variable, Type type, Block block) {

      Map<String, Value> idMap = block.getIdMap();
      if (idMap.containsKey(id)) {
         return idMap.get(id);
      }
      return readVariableFromPredecessors(id, type, block);

   }

   private Value readVariableFromPredecessors(String variable, Type type, Block block) {
      Value val;
      if (!block.isSealed()) {
         val = new RegisterValue(variable + Counter.getVariableCount(variable), type);
         PhiInstruction phiInstr = new PhiInstruction(val, type);
         block.addPhi(variable, phiInstr);
      } else if (block.numPredecessors() == 0) {
         val = new ImmediateValue(-1, new NullType());
      } else if (block.numPredecessors() == 1) {
         val = readVariable(variable, type, block.getPredecessors().get(0));
      } else {
         val = new RegisterValue(variable + Counter.getVariableCount(variable), type);
         PhiInstruction phiInstr = new PhiInstruction(val, type);
         block.addPhi(variable, phiInstr);
         writeVariable(variable, val, block);
         addPhiOperands(variable, block);
      } 

      writeVariable(variable, val, block);
      return val;
   }

   private void addPhiOperands(String variable, Block block) {
      PhiInstruction currPhi = block.getPhis().get(variable);

      for (Block predecessor : block.getPredecessors()) {
         Value val = readVariable(variable, currPhi.getType(), predecessor);
         if (!(val.getType() instanceof NullType)) {
            currPhi.addPhiValue(val, predecessor.getLabel());
         }
      }

   }

   private void sealBlock(Block block) {
      Iterator iter = block.getPhis().entrySet().iterator();
      while (iter.hasNext()) {
         Map.Entry pair = (Map.Entry)iter.next();
         String variable = (String)pair.getKey();
         addPhiOperands(variable, block);
      }
      block.seal();
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
