package ast;

import java.util.List;
import java.util.Map;

public class StructProperties {
   private final String name;
   private final Map<String, Type> fieldMap;
   private final List<String> fieldOrder;

   public StructProperties(String name, Map<String, Type> fieldMap,
                           List<String> fieldOrder) {
      this.name = name;
      this.fieldMap = fieldMap;
      this.fieldOrder = fieldOrder;
   }

   public String getName() {
      return name;
   }

   public Map<String, Type> getFieldMap() {
      return fieldMap;
   }

   public List<String> getFieldOrder() {
      return fieldOrder;
   }
}
