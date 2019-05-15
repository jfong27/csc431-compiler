package ast;

public class ArmComparisonInstruction implements ArmInstruction {

   private final Value val1;
   private final Value val2;

   public ArmComparisonInstruction(Value val1, Value val2) {
      this.val1 = val1;
      this.val2 = val2;
   }

   public String toString() {
      return String.format("cmp %s, %s", val1.toString(), val2.toString());
   }
}
