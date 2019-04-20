package ast;

import java.util.Map;

public class BinaryExpression
   extends AbstractExpression
{
   private final Operator operator;
   private final Expression left;
   private final Expression right;

   private BinaryExpression(int lineNum, Operator operator,
      Expression left, Expression right)
   {
      super(lineNum);
      this.operator = operator;
      this.left = left;
      this.right = right;
   }

   //TODO: Recurse on left/right expressions, add LLVM instructions
   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, Map<String, Type>> structTable) {
      //node.add(new ___Instruction());
      left.addInstructions(node, symTable, structTable);
      right.addInstructions(node, symTable, structTable);
      //TODO: RegisterValue could be Bool type or int type depending on operator
      return new RegisterValue("BINARY EXPRESSION", new IntType());
   }

   public Type typeCheck(Map<String,IdProperties> symTable, 
                         Map<String, Map<String, Type>> structTable) {

      Type leftType = left.typeCheck(symTable, structTable);
      Type rightType = right.typeCheck(symTable, structTable);

      if (operator == Operator.AND || operator == Operator.OR) {
         if (leftType instanceof BoolType && rightType instanceof BoolType) {
            return new BoolType();
         } else {
            System.out.println(getLineNum() + ": Expected two bools");
            System.exit(-1);
         }
      } else if (operator == Operator.TIMES ||
                 operator == Operator.DIVIDE ||
                 operator == Operator.PLUS || 
                 operator == Operator.MINUS) {
         //If operator is <>, ==, !=, etc. then return BoolType()
         if (leftType instanceof IntType && rightType instanceof IntType) {
            return new IntType();
         } else {
            System.out.printf("%d: Expected two ints, found %s and %s\n", 
                              this.getLineNum(), 
                              leftType.getTypeString(),
                              rightType.getTypeString());
            System.exit(-1);
         }
      } else {
         if (leftType instanceof IntType && rightType instanceof IntType) {
            return new BoolType();
         } else {
            System.out.printf("%d: Expected two ints, found %s and %s\n",
                              this.getLineNum(),
                              leftType.getTypeString(),
                              rightType.getTypeString());
            System.exit(-1);
         }
      }

      return new VoidType();

   }

   public static BinaryExpression create(int lineNum, String opStr,
      Expression left, Expression right)
   {
      switch (opStr)
      {
         case TIMES_OPERATOR:
            return new BinaryExpression(lineNum, Operator.TIMES, left, right);
         case DIVIDE_OPERATOR:
            return new BinaryExpression(lineNum, Operator.DIVIDE, left, right);
         case PLUS_OPERATOR:
            return new BinaryExpression(lineNum, Operator.PLUS, left, right);
         case MINUS_OPERATOR:
            return new BinaryExpression(lineNum, Operator.MINUS, left, right);
         case LT_OPERATOR:
            return new BinaryExpression(lineNum, Operator.LT, left, right);
         case LE_OPERATOR:
            return new BinaryExpression(lineNum, Operator.LE, left, right);
         case GT_OPERATOR:
            return new BinaryExpression(lineNum, Operator.GT, left, right);
         case GE_OPERATOR:
            return new BinaryExpression(lineNum, Operator.GE, left, right);
         case EQ_OPERATOR:
            return new BinaryExpression(lineNum, Operator.EQ, left, right);
         case NE_OPERATOR:
            return new BinaryExpression(lineNum, Operator.NE, left, right);
         case AND_OPERATOR:
            return new BinaryExpression(lineNum, Operator.AND, left, right);
         case OR_OPERATOR:
            return new BinaryExpression(lineNum, Operator.OR, left, right);
         default:
            throw new IllegalArgumentException();
      }
   }

   private static final String TIMES_OPERATOR = "*";
   private static final String DIVIDE_OPERATOR = "/";
   private static final String PLUS_OPERATOR = "+";
   private static final String MINUS_OPERATOR = "-";
   private static final String LT_OPERATOR = "<";
   private static final String LE_OPERATOR = "<=";
   private static final String GT_OPERATOR = ">";
   private static final String GE_OPERATOR = ">=";
   private static final String EQ_OPERATOR = "==";
   private static final String NE_OPERATOR = "!=";
   private static final String AND_OPERATOR = "&&";
   private static final String OR_OPERATOR = "||";

   public static enum Operator
   {
      TIMES, DIVIDE, PLUS, MINUS, LT, GT, LE, GE, EQ, NE, AND, OR
   }
}
