package ast;

import java.util.*;

public class LvalueId
   implements Lvalue
{
   private final int lineNum;
   private final String id;

   public LvalueId(int lineNum, String id)
   {
      this.lineNum = lineNum;
      this.id = id;
   }
}
