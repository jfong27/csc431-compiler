package ast;

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

   public Type typeCheck() {
      Type operandType = operand.typeCheck();

      if (this.operator == Operator.NOT && (operandType instanceof BoolType)) {
         return new BoolType();
      } else if (this.operator == Operator.MINUS && (operandType instanceof IntType)) {
         return new IntType();
      } else {
         System.out.println("! requires bool and - requires int");
         System.exit(-1);
      }
   }
}
