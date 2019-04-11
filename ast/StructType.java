package ast;


public class StructType
   implements Type
{
   private final int lineNum;
   private final String name;

   public StructType(int lineNum, String name)
   {
      this.lineNum = lineNum;
      this.name = name;
   }

   //TODO: Double check logic?
   public boolean canConvertTo(Type t) {
      if (t instanceof StructType) {
         StructType structT = (StructType)t;
         if (structT.getName().equals(name)) {
            return true;
         }
      }
      return false;
   }

   public String getName() {
      return name;
   }

   public String getTypeString() {
      return "struct";
   }

}
