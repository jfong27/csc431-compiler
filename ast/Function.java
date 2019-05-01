package ast;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

public class Function
{
   private final int lineNum;
   private final String name;
   private final Type retType;
   private final List<Declaration> params;
   private final List<Declaration> locals;
   private final Statement body;

   public Function(int lineNum, String name, List<Declaration> params,
      Type retType, List<Declaration> locals, Statement body)
   {
      this.lineNum = lineNum;
      this.name = name;
      this.params = params;
      this.retType = retType;
      this.locals = locals;
      this.body = body;
   }

   public String getName() {
      return name;
   }
   
   public Type getRetType() {
      return retType;
   }

   public List<Declaration> getParams() {
      return params;
   }

   public int getNumParams() {
      return params.size();
   }

   public Block createCFGSSA(HashMap<String, IdProperties> symTable,
                             Map<String, StructProperties> structTable) {

      Map<String, IdProperties> localSymTable = addLocalsTo(symTable);

      Block exitNode = new Block(String.format("LU%d", Counter.getBlockCount()));
      Block entryNode = new Block(String.format("LU%d", Counter.getBlockCount()));
      entryNode.seal();

      RegisterValue retReg = new RegisterValue("_retval_", retType);

      for (Declaration decl : params) {

         RegisterValue reg = new RegisterValue(decl.getName(), decl.getType());
         Type type = decl.getType();

         entryNode.updateMap(decl.getName(), reg);
      }

      Block finalBlock = body.createCFGSSA(entryNode, exitNode, localSymTable, structTable);

      finalBlock.addSuccessor(exitNode);
      exitNode.addPredecessor(finalBlock);

      if (!finalBlock.isFinished()) {
         finalBlock.addInstruction(new UnconditionalBranchInstruction(exitNode.getLabel()));
      }
      if (!exitNode.isFinished()) {
         exitNode.addInstruction(new ReturnEmptyInstruction());
      }

      return entryNode;
   }

   public Block createCFG(HashMap<String, IdProperties> symTable,
                          Map<String, StructProperties> structTable) {

      Map<String, IdProperties> localSymTable = addLocalsTo(symTable);

      Block exitNode = new Block(String.format("LU%d", Counter.getBlockCount()));
      Block entryNode = new Block(String.format("LU%d", Counter.getBlockCount()));

      RegisterValue retReg = new RegisterValue("_retval_", retType);
      if (!(retType instanceof VoidType)) {
         entryNode.addInstruction(new AllocateInstruction(retReg, retType));
      }

      for (Declaration decl : locals) {
         RegisterValue localReg = new RegisterValue(decl.getName(), decl.getType());
         entryNode.addInstruction(new AllocateInstruction(localReg, decl.getType()));
      }

      for (Declaration decl : params) {

         RegisterValue reg = new RegisterValue(decl.getName(), decl.getType());
         Type type = decl.getType();
         RegisterValue paramReg = new RegisterValue("_P_" + decl.getName(), decl.getType());

         entryNode.addInstruction(new AllocateInstruction(reg, type));
         entryNode.addInstruction(new StoreInstruction(type, type, paramReg, reg, false));
      }

      Block finalBlock = body.createCFG(entryNode, exitNode, localSymTable, structTable, retType);

      finalBlock.addSuccessor(exitNode);
      if (!finalBlock.isFinished()) {
         finalBlock.addInstruction(new UnconditionalBranchInstruction(exitNode.getLabel()));
      }

      exitNode.clearInstructions();
      if (retType instanceof VoidType) {
         exitNode.addInstruction(new ReturnEmptyInstruction());
      } else {
         RegisterValue tmpReg = new RegisterValue(retType);
         exitNode.addInstruction(new LoadInstruction(tmpReg, retType, retReg, false));
         exitNode.addInstruction(new ReturnInstruction(retType, tmpReg));
      }


      return entryNode;

   }

   private Map<String, IdProperties> addLocalsTo(HashMap<String, IdProperties> symTable) {
      Map<String, IdProperties> localTable = (Map)symTable.clone();

      for (Declaration decl : params) {
         localTable.put(decl.getName(), new IdProperties(decl.getType(), false, false, null));
      }

      for (Declaration decl : locals) {
         localTable.put(decl.getName(), new IdProperties(decl.getType(), false, false, null));
      }

      return localTable;

   }

   public Type typeCheck(HashMap<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {

      Map<String, IdProperties> symTableClone = (Map)symTable.clone();

      for (Declaration decl : params) {
         symTableClone.put(decl.getName(), new IdProperties(decl.getType(), false, false, null));
      }
      for (Declaration decl : locals) {
         symTableClone.put(decl.getName(), new IdProperties(decl.getType(), false, false, null));
      }

      body.typeCheck(symTableClone, structTable, retType);

      return retType;
   }

   public boolean doesReturn() {
      return body.doesReturn();
   }

}
