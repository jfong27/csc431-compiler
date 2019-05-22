package ast;

import java.util.ArrayList;
import java.util.List;

public class PhiInstruction implements Instruction {

   private final Value result;
   private final Type ty;
   private List<ValueLabelPair> phiValues;
   private final int armPhiNum;

   public PhiInstruction(Value result, Type ty) {
      this.result = result;
      this.ty = ty;
      this.phiValues = new ArrayList<>();
      this.armPhiNum = Counter.getPhiCount();
   }

   public void addPhiValue(Value value, String label) {
      phiValues.add(new ValueLabelPair(value, label));
   }

   public Value getResult() { return result; }

   public List<ValueLabelPair> getPhis() {
      return phiValues;
   }

   public Type getType() { return ty; }

   public int getPhiNum() {
      return armPhiNum;
   }

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

   public List<ArmInstruction> toArm() {
      List<ArmInstruction> armInstrucs = new ArrayList<>();

      String phiRegName = "_phi" + Integer.toString(armPhiNum);
      RegisterValue phi = new RegisterValue(phiRegName, new IntType());
      armInstrucs.add(new ArmMoveInstruction(result, phi));
      return armInstrucs;
   }

}
