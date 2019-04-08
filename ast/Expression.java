package ast;

import java.util.Map;

public interface Expression
{
   public Type typeCheck(Map<String, IdProperties> symTable);
}
