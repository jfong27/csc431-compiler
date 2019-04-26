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
                                Map<String, StructProperties> structTable) {
      RegisterValue resultReg;
      RegisterValue res;
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
            res = new RegisterValue(new BoolType());
            node.addInstruction(new ComparisonInstruction(res, "slt",
                                                           new IntType(), leftVal, rightVal));
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new ZextInstruction(resultReg, res));
            break;
         case GT:
            res = new RegisterValue(new BoolType());
            node.addInstruction(new ComparisonInstruction(res, "sgt",
                                                           new IntType(), leftVal, rightVal));
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new ZextInstruction(resultReg, res));
            break;
         case LE:
            res = new RegisterValue(new BoolType());
            node.addInstruction(new ComparisonInstruction(res, "sle",
                                                           new IntType(), leftVal, rightVal));
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new ZextInstruction(resultReg, res));
            break;
         case GE:
            res = new RegisterValue(new BoolType());
            node.addInstruction(new ComparisonInstruction(res, "sge",
                                                           new IntType(), leftVal, rightVal));
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new ZextInstruction(resultReg, res));
            break;
         case EQ:
            res = new RegisterValue(new BoolType());
            node.addInstruction(new ComparisonInstruction(res, "eq",
                                                           new IntType(), leftVal, rightVal));
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new ZextInstruction(resultReg, res));
            break;
         case NE:
            res = new RegisterValue(new BoolType());
            node.addInstruction(new ComparisonInstruction(res, "ne",
                                                           new IntType(), leftVal, rightVal));
            resultReg = new RegisterValue(new BoolType());
            node.addInstruction(new ZextInstruction(resultReg, res));
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
