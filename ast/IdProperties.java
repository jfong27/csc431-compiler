package ast;

import java.util.List;

public class IdProperties {
   private final Type type;
   private final boolean isGlobal;
   private final boolean isFunction;
   private final List<Declaration> params;

   public IdProperties(Type type, boolean isGlobal,
                       boolean isFunction, List<Declaration> params) {
      this.type = type;
      this.isGlobal = isGlobal;
      this.isFunction = isFunction;
      this.params = params;
   }

   public Type getType() {
      return type;
   }

   public boolean isFunction() {
      return isFunction;
   }

   public boolean isGlobal() {
      return isGlobal;
   }

   public List<Declaration> getParams() {
      return params;
   }
}
