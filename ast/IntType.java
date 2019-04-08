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
}
