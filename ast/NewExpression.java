package ast;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class NewExpression
   extends AbstractExpression
{
   private final String id;

   public NewExpression(int lineNum, String id)
   {
      super(lineNum);
      this.id = id;
   }

   public Value addInstructionsSSA(Block node, 
                                   Map<String, IdProperties> symTable,
                                   Map<String, StructProperties> structTable) {

      Map<String, Type> struct = structTable.get(id).getFieldMap();

      Type structType = new StructType(id);
      RegisterValue mallocResult = new RegisterValue(new PointerType());
      RegisterValue bitcastResult = new RegisterValue(structType);

      Value arg = new ImmediateValue(4 * struct.size(), new IntType());
      List<Value> args = new ArrayList<>();
      args.add(arg);
      List<Declaration> decls = new ArrayList<>();
      Instruction callInstr = new CallInstruction(mallocResult, new PointerType(), 
                                                  "malloc", args, decls);

      Instruction bitcastInstr = new BitcastInstruction(bitcastResult, mallocResult.getType(),
                                                        mallocResult, structType);
      node.addInstruction(callInstr);
      node.addInstruction(bitcastInstr);

      return bitcastResult;
   }


   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, StructProperties> structTable) {

      Map<String, Type> struct = structTable.get(id).getFieldMap();

      Type structType = new StructType(id);
      RegisterValue mallocResult = new RegisterValue(new PointerType());
      RegisterValue bitcastResult = new RegisterValue(structType);


      //Malloc should be 4 * number of fields
      Value arg = new ImmediateValue(4 * struct.size(), new IntType());
      List<Value> args = new ArrayList<>();
      args.add(arg);
      List<Declaration> decls = new ArrayList<>();
      Instruction callInstr = new CallInstruction(mallocResult, new PointerType(), 
                                                  "malloc", args, decls);

      Instruction bitcastInstr = new BitcastInstruction(bitcastResult, mallocResult.getType(),
                                                        mallocResult, structType);
      node.addInstruction(callInstr);
      node.addInstruction(bitcastInstr);
      return bitcastResult;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {

      return new StructType(this.getLineNum(), id);
   }
}
