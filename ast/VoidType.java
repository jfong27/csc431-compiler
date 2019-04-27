package ast;

public class VoidType
   implements Type
{
   public boolean canConvertTo(Type t) {
      return (t instanceof VoidType ||
              t instanceof StructType);
   }

   public String getTypeString() {
      return "void";
   }

   public String toString() {
      return "void";
   }

   public String toLLVMType() {
      return "i1";
   }
}
