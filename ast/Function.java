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

   public Block createCFG() {
      Block exitNode = new Block(String.format("LU%d", Counter.getBlockCount()));
      Block entryNode = new Block(String.format("LU%d", Counter.getBlockCount()));

      RegisterValue retReg = new RegisterValue("retval");
      entryNode.addInstruction(new AllocateInstruction(retReg, retType));
      for (Declaration decl : params) {
         RegisterValue reg = new RegisterValue("P_" + decl.getName());
         Type type = decl.getType();
         RegisterValue paramReg = new RegisterValue(decl.getName());

         entryNode.addInstruction(new AllocateInstruction(reg, type));
         entryNode.addInstruction(new StoreInstruction(type, type, paramReg, reg));
      }
      for (Declaration decl : locals) {

      }
      body.createCFG(entryNode, exitNode);
      return entryNode;
   }

   public Type typeCheck(HashMap<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {

      Map<String, IdProperties> symTableClone = (Map)symTable.clone();

      for (Declaration decl : params) {
         symTableClone.put(decl.getName(), new IdProperties(decl.getType(), false, null));
      }
      for (Declaration decl : locals) {
         symTableClone.put(decl.getName(), new IdProperties(decl.getType(), false, null));
      }

      body.typeCheck(symTableClone, structTable, retType);

      return retType;
   }

   public boolean doesReturn() {
      return body.doesReturn();
   }

}
