package ast;

public interface Type
{
   public boolean canConvertTo(Type type);
   //TODO: implement equals for all type classes
   public boolean equals(Type type);
}
