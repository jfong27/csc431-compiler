package ast;

public class UpperValue implements Value {

   private final int val;

   public UpperValue(int val) {
      this.val = val;
   }

   public String toString() {
      return "#:lower16:" + Integer.toString(val);
   }

   public String toStringArm() {
      return "#:lower16:" + Integer.toString(val);
   }

   public Type getType() {
      return new IntType();
   }

   @Override
   public boolean equals(Object o) {
      if (o == this) { return true; }
      if (!(o instanceof Value)) {
         return false;
      }
      return ((Value)o).toStringArm().equals(toStringArm());
   }

   @Override
   public int hashCode {
      return Objects.hash(toStringArm());
   }

}
