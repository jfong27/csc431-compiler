package ast;

import java.util.HashMap;
import java.util.Map;

public class Counter {
   private static int counter;
   private static int blockCounter;
   private static int regCounter;
   private static Map<String, Integer> variables = new HashMap<>();

   public static int getCount() {
      return counter++;
   }

   public static int getBlockCount() {
      return blockCounter++;
   }

   public static int getRegCount() {
      return regCounter++;
   }

   public static String getVariableCount(String variable) {
      if (variables.containsKey(variable)) {
         int currCount = variables.get(variable);
         variables.put(variable, currCount + 1);
         return Integer.toString(currCount);
      }
      variables.put(variable, 1);
      return "0";
   }

   public static void resetVariableCounter() {
      variables.clear();
   }
}
