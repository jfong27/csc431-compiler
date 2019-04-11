package ast;

public class VoidType
   implements Type
{
   public boolean canConvertTo(Type t) {
      return t instanceof VoidType;
   }

   public String getTypeString() {
      return "void";
   }
}
