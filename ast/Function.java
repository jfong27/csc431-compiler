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
      List<Statement> stmts = ((BlockStatement)body).getStatements();
      List<Statement> entryStmts = new ArrayList<>();
      List<Statement> exitStmts = new ArrayList<>();
      Block entryNode;
      Block exitNode;
      for (Statement stmt : stmts) {
         if (stmt.isConditional()) {
            entryNode = new Block(name, 
         } else {
            entryStmts.append(stmt);
         }
      }

      

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
