package ast;
/* Symbol Table value. 
 *Scope level is probably not an integer.
 * Just a placeholder */
public class IdProperties {
   private final Integer scopeLevel;
   private final Type type;

   public IdProperties(Type type, Integer scopeLevel) {
      this.type = type;
      this.scopeLevel = scopeLevel;
   }

}
