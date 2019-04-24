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

   public StructType(String name) {
      this.lineNum = -1;
      this.name = name;
   }

   public boolean canConvertTo(Type t) {
      if (t instanceof StructType) {
         StructType structT = (StructType)t;
         if (structT.getName().equals(name)) {
            return true;
         }
      } else if (t instanceof VoidType) {
         return true;
      }
      return false;
   }

   public String getName() {
      return name;
   }

   public String getTypeString() {
      return "struct " + name;
   }
   
   public String toLLVMType() {
      return String.format("%%struct.%s", name);
   }

   public String toString() {
      return String.format("%%struct.%s*", name);
   }
}
