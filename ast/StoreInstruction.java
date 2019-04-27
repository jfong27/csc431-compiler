package ast;

public class StoreInstruction implements Instruction {

   private final Type fromType;
   private final Type toType;

   private final Value from;
   private final Value to;

   private final boolean isGlobal;

   public StoreInstruction(Type fromType, Type toType,
                           Value from, Value to, boolean isGlobal) {
      this.fromType = fromType;
      this.toType = toType;
      this.from = from;
      this.to = to;
      this.isGlobal = isGlobal;
   }

   public String toString() {
      String fromTypeStr = fromType.toString();
      String toTypeStr = toType.toString();
      String toString;

      if (isGlobal) {
         toString = "@" + ((RegisterValue)to).getName();
      } else {
         toString = to.toString();
      }
      
      return String.format("store %s %s, %s* %s",
                           fromTypeStr, from.toString(),
                           toTypeStr, toString);
   }

}
