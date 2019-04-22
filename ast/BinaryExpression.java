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

   public Value addInstructions(Block node, 
                                Map<String, IdProperties> symTable,
                                Map<String, Map<String, Type>> structTable) {
      RegisterValue resultReg;
      Value leftVal = left.addInstructions(node, symTable, structTable);
      Value rightVal = right.addInstructions(node, symTable, structTable);

      switch (operator) {
         case TIMES:
            resultReg = new RegisterValue(new IntType());
            node.addInstruction(new BinaryInstruction(resultReg, "mul",
                                                      new IntType(), leftVal, rightVal));
            break;
         case DIVIDE:
            resultReg = new RegisterValue(new IntType());
            node.addInstruction(new BinaryInstruction(resultReg, "sdiv",
                                                      new IntType(), leftVal, rightVal));
            break;
         case PLUS:
            resultReg = new RegisterValue(new IntType());
            node.addInstruction(new BinaryInstruction(resultReg, "add",
                                                      new IntType(), leftVal, rightVal));
            break;
         case MINUS:
            resultReg = new RegisterValue(new IntType());
            node.addInstruction(new BinaryInstruction(resultReg, "sub",
                                                      new IntType(), leftVal, rightVal));
            break;
         case AND:
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new BinaryInstruction(resultReg, "and",
                                                      new IntType(), leftVal, rightVal));
            break;
         case OR:
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new BinaryInstruction(resultReg, "or",
                                                      new IntType(), leftVal, rightVal));
            break;
         case LT:
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new ComparisonInstruction(resultReg, "slt",
                                                           new IntType(), leftVal, rightVal));
            break;
         case GT:
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new ComparisonInstruction(resultReg, "sgt",
                                                           new IntType(), leftVal, rightVal));
            break;
         case LE:
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new ComparisonInstruction(resultReg, "sle",
                                                           new IntType(), leftVal, rightVal));
            break;
         case GE:
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new ComparisonInstruction(resultReg, "sge",
                                                           new IntType(), leftVal, rightVal));
            break;
         case EQ:
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new ComparisonInstruction(resultReg, "eq",
                                                           new IntType(), leftVal, rightVal));
            break;
         case NE:
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new ComparisonInstruction(resultReg, "ne",
                                                           new IntType(), leftVal, rightVal));
            break;
         default:
            resultReg = new RegisterValue(new IntType());
            break;

      }


      return resultReg;
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
