package ast;

public class PointerType
   implements Type
{
    public boolean equals(Type t) {
        if (t instanceof PointerType) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean canConvertTo(Type t) {
       if (t instanceof PointerType) {
          return true;
       } 
       return false;
    }

    public String getTypeString() {
      return "i8";
    }

    public String toLLVMType() {
       return "i8";
    }

    public String toString() {
       return "i8*";
    }

}
