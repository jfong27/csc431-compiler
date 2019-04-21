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
      return String.format("store %s %s, %s* %s",
                           fromType.toString(), from.toString(),
                           toType.toString(), to.toString());
   }

}
