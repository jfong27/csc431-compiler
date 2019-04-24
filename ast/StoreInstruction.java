package ast;

public class StoreInstruction implements Instruction {

   Type fromType;
   Type toType;

   Value from;
   Value to;

   public StoreInstruction(Type fromType, Type toType,
                           Value from, Value to) {
      this.fromType = fromType;
      this.toType = toType;
      this.from = from;
      this.to = to;
   }

   public String toString() {
      String fromTypeStr = fromType.toString();
      String toTypeStr = toType.toString();
      
      /*
      if (fromType instanceof StructType) {
         fromTypeStr += "*";
      }
      if (toType instanceof StructType) {
         toTypeStr += "*";
      }
      */
      return String.format("store %s %s, %s* %s",
                           fromTypeStr, from.toString(),
                           toTypeStr, to.toString());
   }

}
