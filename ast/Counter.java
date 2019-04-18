package ast;

public class Counter {
   private static int counter;
   private static int blockCounter;

   public static int getCount() {
      return counter++;
   }

   public static int getBlockCount() {
      return blockCounter++;
   }
}
