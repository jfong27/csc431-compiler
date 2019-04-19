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

      if (type instanceof IntType) {
         return "i32";
      }
      return "DECL TYPE";

   }
}
