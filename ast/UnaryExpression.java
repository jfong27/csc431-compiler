package ast;

import java.util.Map;

public class UnaryExpression
   extends AbstractExpression
{
   private final Operator operator;
   private final Expression operand;

   private UnaryExpression(int lineNum, Operator operator, Expression operand)
   {
      super(lineNum);
      this.operator = operator;
      this.operand = operand;
   }

   public static UnaryExpression create(int lineNum, String opStr,
      Expression operand)
   {
      if (opStr.equals(NOT_OPERATOR))
      {
         return new UnaryExpression(lineNum, Operator.NOT, operand);
      }
      else if (opStr.equals(MINUS_OPERATOR))
      {
         return new UnaryExpression(lineNum, Operator.MINUS, operand);
      }
      else
      {
         throw new IllegalArgumentException();
      }
   }

   private static final String NOT_OPERATOR = "!";
   private static final String MINUS_OPERATOR = "-";

   public static enum Operator
   {
      NOT, MINUS
   }


   //TODO: NOT
   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, StructProperties> structTable) {

      RegisterValue resultReg;
      Value oprndVal = operand.addInstructions(node, symTable, structTable);

      switch (operator) {
         case NOT:
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new TestInstruction("How to do NOT? UnaryExpr"));
            break;
         case MINUS:
            resultReg = new RegisterValue(new IntType());
            Value negValue = new ImmediateValue(-1, new IntType());
            node.addInstruction(new BinaryInstruction(resultReg, "mul",
                                                      new IntType(), oprndVal,
                                                      negValue));
            break;
         default:
            resultReg = new RegisterValue(new BoolType());
            break;
      }

      return resultReg;
   }

   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable) {

      Type operandType = this.operand.typeCheck(symTable, structTable);

      if (this.operator == Operator.NOT && (operandType instanceof BoolType)) {
         return new BoolType();
      } else if (this.operator == Operator.MINUS && (operandType instanceof IntType)) {
         return new IntType();
      } else {
         System.out.println(getLineNum() + ": Operator ! requires bool and Operator - requires int");
         System.exit(-1);
      }

      return new VoidType();
   }
}
