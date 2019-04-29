package ast;

public class NullType implements Type {

   public boolean equals(Object o) {
      if (o instanceof NullType) {
         return true;
      }
      return false;
   }

   public boolean canConvertTo(Type t) {
      return true;
   }

   public String getTypeString() {
      return "null";
   }

   public String toLLVMType() {
      return "null";
   }

   public String toString() {
      return "null";
   }
}
