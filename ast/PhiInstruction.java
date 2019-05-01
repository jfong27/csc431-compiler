package ast;

public class PhiInstruction implements Instruction {

   private final Value result;
   private final Type ty;
   private List<ValueLabelPair> phiValues;

   public PhiInstruction(Value result, Type ty,
                         List<ValueLabelPair> phiValues) {
      this.result = result;
      this.ty = ty;
      this.phiValues = phiValues
   }

   public String toString() {
      StringBuilder sb = new StringBuilder(result.toString());
      sb.append(String.format(" = phi %s ", ty.toString()));

      for (ValueLabelPair pair : phiValues) {
         sb.append(String.format("[%s, %s] ", pair.getValue().toString(),
                                 pair.getLabel()));
      }

   }

}
