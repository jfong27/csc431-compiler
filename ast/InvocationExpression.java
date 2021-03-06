package ast;

import java.util.ArrayList;
import java.util.Map;
import java.util.List;

public class InvocationExpression
   extends AbstractExpression
{
   private final String name;
   private final List<Expression> arguments;

   public InvocationExpression(int lineNum, String name,
      List<Expression> arguments)
   {
      super(lineNum);
      this.name = name;
      this.arguments = arguments;
   }

   public Value addInstructionsSSA(Block node, 
                                   Map<String, IdProperties> symTable,
                                   Map<String, StructProperties> structTable) {

      IdProperties func = symTable.get(name);

      RegisterValue resultReg;
     
      if (func.getType() instanceof VoidType) {
         resultReg = null;
      } else {
         resultReg = new RegisterValue(func.getType());
      }
      List<Value> args = new ArrayList<>();
      for (Expression arg : arguments) {
         args.add(arg.addInstructionsSSA(node, symTable, structTable));
      }
      node.addInstruction(new CallInstruction(resultReg, func.getType(),
                                              name, args, func.getParams()));

      return resultReg;
   }

  
   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, StructProperties> structTable) {

      IdProperties func = symTable.get(name);
      RegisterValue resultReg;
     
      if (func.getType() instanceof VoidType) {
         resultReg = null;
      } else {
         resultReg = new RegisterValue(func.getType());
      }
      List<Value> args = new ArrayList<>();
      for (Expression arg : arguments) {
         args.add(arg.addInstructions(node, symTable, structTable));
      }
      node.addInstruction(new CallInstruction(resultReg, func.getType(),
                                              name, args, func.getParams()));

      return resultReg;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {

      IdProperties func = symTable.get(this.name);

      if (symTable.containsKey(this.name) && 
          func.isFunction()) {
         if (this.arguments.size() > func.getParams().size()) {
            System.out.printf("%d: Too many arguments provided to function %s\n", 
                              getLineNum(), this.name);
            System.exit(-1);
         } else if (this.arguments.size() < func.getParams().size()) {
            System.out.println(getLineNum() + ": Too few arguments");
            System.exit(-1);
         }

         List<Declaration> params = func.getParams();

         for (int i = 0; i < func.getParams().size(); i++) {
            Type argType = arguments.get(i).typeCheck(symTable, structTable);
            Type paramType = params.get(i).getType();
            if (!(paramType.canConvertTo(argType))) {
               System.out.printf("%d: Invalid argument type. Expected %s, found %s\n",
                                 getLineNum(), paramType.getTypeString(), argType.getTypeString() );
               System.exit(-1);
            }
         }


         return symTable.get(this.name).getType();
      } else {
         System.out.println(getLineNum()+": "+this.name+" is not a struct");
         System.exit(-1);
      }

      return new VoidType();
   }

}
