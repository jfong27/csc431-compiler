package ast;

public class ImmediateValue implements Value {

   private final int val;

   public ImmediateValue(int val) {
      this.val = val;
   }

   public String toString() {
      return Integer.toString(val);
   }
}
