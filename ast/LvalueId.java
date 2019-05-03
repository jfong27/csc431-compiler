package ast;

import java.util.Iterator;
import java.util.Map;

public class LvalueId
   implements Lvalue
{
   private final int lineNum;
   private final String id;

   public LvalueId(int lineNum, String id)
   {
      this.lineNum = lineNum;
      this.id = id;
   }
   
   public String getId() {
      return id;
   }

   public Value addInstructionsSSA(Block node, 
                                   Map<String, IdProperties> symTable,
                                   Map<String, StructProperties> structTable) {

      Type idType = symTable.get(id).getType();
      return readVariable(id, idType, node);
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
         val = new RegisterValue(variable + "0", type);
         PhiInstruction phiInstr = new PhiInstruction(val, type);
         block.addPhi(variable, phiInstr);
      } else if (block.numPredecessors() == 0) {
         val = new ImmediateValue(-1, new NullType());
      } else if (block.numPredecessors() == 1) {
         val = readVariable(variable, type, block.getPredecessors().get(0));
      } else {
         val = new RegisterValue(variable + "0", type);
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
         currPhi.addPhiValue(readVariable(variable, currPhi.getType(), predecessor), 
                             predecessor.getLabel());
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

      IdProperties idResult = symTable.get(id);
      return new RegisterValue(id, idResult.getType());
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {
      if (!symTable.containsKey(id)) {
         System.out.println("Variable '"+id+"' is undeclared");
         System.exit(-1);
      }
      return symTable.get(id).getType();
   }

   public String toString() {
      return id;
   }

}
