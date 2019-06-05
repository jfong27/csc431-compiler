package ast;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ArmStoreInstruction implements ArmInstruction {

   private final Value source;
   private final Value address;

   public ArmStoreInstruction(Value source, Value address) {
      this.source = source;
      this.address = address;
   }

   public String toString() {

      String sourceStr;
      String addrStr;

      addrStr = address.toStringArm();
      sourceStr = source.toStringArm();
      return String.format("str %s, [%s]", 
                           sourceStr, addrStr);
   }

 
   public String toString(Map<String, String> regMap) {

      String sourceStr;
      String addrStr;

      addrStr = regMap.get(address.toStringArm());
      if (source instanceof ImmediateValue) {
         sourceStr = source.toStringArm();
      } else {
         sourceStr = regMap.get(source.toStringArm());
      }
      return String.format("str %s, [%s]", 
                           sourceStr, addrStr);
   }

   public Set<Value> getSources() {
      Set<Value> sources = new HashSet<>();
      if (!(source instanceof ImmediateValue)) {
         sources.add(source);
         sources.add(address);
      }
      return sources;
   }

   public Set<Value> getTargets() {
      Set<Value> targets = new HashSet<>();
      return targets;
   }

}
