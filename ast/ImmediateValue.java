package ast;

public class ImmediateValue implements Value {

   private final int val;
   private final Type type;

   public ImmediateValue(int val, Type type) {
      this.val = val;
      this.type = type;
   }

   public String toString() {
      if (type instanceof BoolType) {
         if (val == 0) {
            return "0";
         } 
         return "1";
      } else if (type instanceof NullType) {
         return "null";
      }
      return Integer.toString(val);
   }


   public String toStringArm() {
      if (val < 0) {
         return "#" + Integer.toString(val * -1);
      }
      return "#" + Integer.toString(val);
   }

   public Type getType() {
      return type;
   }

   public int getVal() {
      return val;
   }
}
