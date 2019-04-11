package ast;

public class VoidType
   implements Type
{
   public boolean canConvertTo(Type t) {
      return t instanceof VoidType;
   }
}
