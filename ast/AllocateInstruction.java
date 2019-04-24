package ast;

public class AllocateInstruction implements Instruction {

   private final RegisterValue reg;
   private final Type type;

   public AllocateInstruction(RegisterValue reg, Type type) {
      this.reg= reg;
      this.type = type;
   }

   public String toString() {
      String typeString = type.toString();
      /*
      if (type instanceof StructType) {
         typeString += "*";
      }
      */

      return String.format("%s = alloca %s", reg.toString(), typeString);
   }

}
