package ast;

public class AllocateInstruction implements Instruction {

   private final RegisterValue reg;
   private final Type type;

   public AllocateInstruction(RegisterValue reg, Type type) {
      this.reg= reg;
      this.type = type;
   }

   public String toString() {
      return String.format("%s = alloca %s", reg.toString(), type.toLLVMType());
   }

}
