package ast;

public interface Type
{
   public boolean canConvertTo(Type type);
   public String getTypeString();
   public String toLLVMType();
   public String toString();
}
