package ast;

import java.util.ArrayList;
import java.util.List;

public class PhiInstruction implements Instruction {

   private final Value result;
   private final Type ty;
   private List<ValueLabelPair> phiValues;

   public PhiInstruction(Value result, Type ty) {
      this.result = result;
      this.ty = ty;
      this.phiValues = new ArrayList<>();
   }

   public void addPhiValue(Value value, String label) {
      phiValues.add(new ValueLabelPair(value, label));
   }

   public Value getResult() { return result; }

   public List<ValueLabelPair> getPhis() {
      return phiValues;
   }

   public Type getType() { return ty; }

   public String toString() {
      StringBuilder sb = new StringBuilder(result.toString());
      sb.append(String.format(" = phi %s ", ty.toString()));

      for (ValueLabelPair pair : phiValues) {
         sb.append(String.format("[%s, %%%s], ", pair.getValue().toString(),
                                 pair.getLabel()));
      }

      sb.deleteCharAt(sb.length() - 2);
      
      return sb.toString();
   }

}
