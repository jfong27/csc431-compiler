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
}
