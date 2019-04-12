package ast;

import java.util.List;

public class IdProperties {
   private final Type type;
   private final boolean isFunction;

   public IdProperties(Type type, boolean isFunction) {
      this.type = type;
      this.isFunction = isFunction;
   }

   public Type getType() {
      return type;
   }

   public boolean isFunction() {
      return isFunction;
   }
}
