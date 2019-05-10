package ast;


public class Declaration
{
   private final int lineNum;
   private final Type type;
   private final String name;

   public Declaration(int lineNum, Type type, String name)
   {
      this.lineNum = lineNum;
      this.type = type;
      this.name = name;
   }

   public Type getType() {
      return type;
   }

   public String getName() {
      return name;
   }

   public Type typeCheck() {
       return type;
   }

   public String toString() {

      if (type instanceof IntType ||
          type instanceof BoolType) {
         return "i32";
      } 
      if (type instanceof VoidType) {
         return "void";
      }
      StructType struct = (StructType)type;

      return "%struct." + struct.getName() + "*";
   }
}
