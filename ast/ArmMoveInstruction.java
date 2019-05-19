package ast;

public class ArmMoveInstruction implements ArmInstruction {

   private final RegisterValue result;
   private final Value source;
   private final String cond;

   public ArmMoveInstruction(RegisterValue result, Value source) {
      this.result = result;
      this.source = source;
      this.cond = null;
   }

   public ArmMoveInstruction(RegisterValue result, Value source, String cond) {
      this.result = result;
      this.source = source;
      this.cond = cond;
   }

   public String toString() {

      if (result == null) {
         return "NULL RESULT ARM MOVE";
      }

      if (cond != null) {
         if (cond.equals("eq")) {
            return String.format("moveq %s, %s", 
                                 result.toString(),
                                 source.toStringArm());
         } else if (cond.equals("ne")) {
            return String.format("movne %s, %s",
                                 result.toString(),
                                 source.toStringArm());
         } else {
            String mov = cond.substring(1);
            return String.format("mov%s %s, %s",
                                 mov, result.toString(),
                                 source.toStringArm());
         }
      }

      return String.format("mov %s, %s",   
                           result.toString(),
                           source.toStringArm()); 
   }
}
