package ast;

public class IntType
   implements Type
{
    public boolean equals(Type t) {
        if (t instanceof IntType) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean canConvertTo(Type t) {
       if (t instanceof IntType) {
          return true;
       } 
       return false;
    }

    public String getTypeString() {
      return "int";
    }

    public String toLLVMType() {
       return "i32";
    }

    public String toString() {
       return "i32";
    }

}
