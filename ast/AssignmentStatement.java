package ast;

import java.util.Map;

public class AssignmentStatement
   extends AbstractStatement
{
   private final Lvalue target;
   private final Expression source;

   public AssignmentStatement(int lineNum, Lvalue target, Expression source)
   {
      super(lineNum);
      this.target = target;
      this.source = source;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType) {

      Type lValueType = target.typeCheck(symTable, structTable);
      Type sourceType = source.typeCheck(symTable, structTable);

      if (!sourceType.canConvertTo(lValueType)) {
         System.out.println(getLineNum() + ": cannot assign "+sourceType.getTypeString()+
                            " to "+lValueType.getTypeString());
         System.exit(-1);
      } 

      return sourceType;

   }

   //TODO
   public Block createCFGSSA(Block entryNode, Block exitNode,
                             Map<String, IdProperties> symTable,
                             Map<String, StructProperties> structTable) {

      Value sourceReg = source.addInstructionsSSA(entryNode, symTable, structTable);
      Value targetReg = target.addInstructionsSSA(entryNode, symTable, structTable);

      entryNode.updateMap(target.getId(), sourceReg);


      return entryNode;
   }
                              

   public Block createCFG(Block entryNode, Block exitNode,
                          Map<String, IdProperties> symTable,
                          Map<String, StructProperties> structTable) {

      Value sourceReg = source.addInstructions(entryNode, symTable, structTable);
      Value targetReg = target.addInstructions(entryNode, symTable, structTable);

      String targetName = ((RegisterValue)targetReg).getName();
      IdProperties targetProperties = symTable.get(targetName);

      Type targetType = targetReg.getType();
      Type sourceType = sourceReg.getType();
      if (sourceType instanceof NullType) {
         sourceType = targetType;
      }

      StoreInstruction instr;
      if (targetProperties == null) {
         instr = new StoreInstruction(sourceType, targetType,
                                      sourceReg, targetReg, false);
      } else {
         boolean isTargetGlobal = targetProperties.isGlobal();
         instr = new StoreInstruction(sourceType, targetType,
                                      sourceReg, targetReg, isTargetGlobal);
      }
      entryNode.addInstruction(instr);
      return entryNode;
   }

   public boolean doesReturn() {
      return false;
   }

   public boolean isConditional() {
      return false;
   }

}
