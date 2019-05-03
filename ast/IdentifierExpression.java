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
      System.out.println("Fetching id: " + id);
      Type idType = symTable.get(id).getType();
      return readVariable(id, idType, node);
   }

   private void writeVariable(String variable, Value value, Block block) {
      System.out.println("Writing variable " + variable + " <- " + value.toString());
      block.updateMap(variable, value);
   }

   private Value readVariable(String variable, Type type, Block block) {

      Map<String, Value> idMap = block.getIdMap();
      if (idMap.containsKey(id)) {
         System.out.println("Found in block " + block.getLabel());
         return idMap.get(id);
      }
      System.out.println("Reading from predecessors of " + block.getLabel());
      System.out.println("Predecessors: ");
      for (Block b : block.getPredecessors()) {
         System.out.println(b.getLabel());
      }
      return readVariableFromPredecessors(id, type, block);

   }

   private Value readVariableFromPredecessors(String variable, Type type, Block block) {
      Value val;
      if (!block.isSealed()) {
         System.out.println("Block is not sealed");
         val = new RegisterValue(variable + "0", type);
         PhiInstruction phiInstr = new PhiInstruction(val, type);
         block.addPhi(variable, phiInstr);
      } else if (block.numPredecessors() == 0) {
         System.out.println("Variable was not set");
         val = new ImmediateValue(-1, new NullType());
      } else if (block.numPredecessors() == 1) {
         System.out.println("Only 1 predecessor, reading from pred");
         val = readVariable(variable, type, block.getPredecessors().get(0));
      } else {
         System.out.println("Block not sealed, multiple predecessors");
         val = new RegisterValue(variable + "0", type);
         PhiInstruction phiInstr = new PhiInstruction(val, type);
         block.addPhi(variable, phiInstr);
         writeVariable(variable, val, block);
         addPhiOperands(variable, block);
      } 

      writeVariable(variable, val, block);
      System.out.println("Returning val: " + val.toString());
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
