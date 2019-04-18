package ast;

public class BoolType
   implements Type
{
    public boolean equals(Type t) {
        if (t instanceof BoolType) {
            return true;
        } else {
            return false;
        }
    }

   //TODO: IMPLEMENT
    public boolean canConvertTo(Type t) {
       if (t instanceof BoolType) {
         return true;
       }
       return false;
    }

    public String getTypeString() {
      return "bool";
    }
    
    public String toLLVMType() {
       return "i1";
    }

}
