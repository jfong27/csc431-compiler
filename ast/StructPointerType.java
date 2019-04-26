package ast;

public class StructPointerType
   implements Type
{
    public boolean equals(Type t) {
        if (t instanceof StructPointerType) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean canConvertTo(Type t) {
       if (t instanceof StructPointerType) {
          return true;
       } 
       return false;
    }

    public String getTypeString() {
      return "struct*";
    }

    public String toLLVMType() {
       return "i8";
    }

    public String toString() {
       return "i8*";
    }

}
