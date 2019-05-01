package ast;

public class ValueLabelPair {

   private final Value value;
   private final String label;

   public ValueLabelPair(Value value, String label) {
      this.value = value;
      this.label = label;
   }

   public Value getValue() {
      return value;
   }

   public String getLabel() {
      return label;
   }

}
