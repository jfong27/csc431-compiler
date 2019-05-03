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
      return readVariable(id, idType, node);
   }

   private void writeVariable(String variable, Value value, Block block) {
      System.out.println("Updating map: " + variable);
      block.updateMap(variable, value);
   }

   private Value readVariable(String variable, Type type, Block block) {

      Map<String, Value> idMap = block.getIdMap();
      if (idMap.containsKey(id)) {
         return idMap.get(id);
      }
      return readVariableFromPredecessors(id, type, block);

   }

   //TODO: Follow braun's algorithm. 
   private Value readVariableFromPredecessors(String variable, Type type, Block block) {
      System.out.println("READ VAR PRED");
      Value val;
      if (!block.isSealed()) {
         System.out.println("Block not sealed");
         val = new RegisterValue(variable + "0", type);
         PhiInstruction phiInstr = new PhiInstruction(val, type);
         System.out.println("Adding phi for variable: " + variable);
         block.addPhi(variable, phiInstr);
      } else if (block.numPredecessors() == 0) {
         System.out.println("Not assigned");
         val = new ImmediateValue(-1, new NullType());
      } else if (block.numPredecessors() == 1) {
         System.out.println("Only 1 pred");
         val = readVariable(variable, type, block.getPredecessors().get(0));
      } else {
         System.out.println("Add phi ops");
         System.out.println("Getting phis of variable: " + variable);
         //val = block.getPhis().get(variable).getResult();
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
      System.out.println("ADD PHI OPS");
      System.out.println(variable);
      System.out.println(block.getPhis());
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
