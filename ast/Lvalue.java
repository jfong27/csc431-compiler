package ast;

import java.util.Map;

public interface Lvalue
{
   public Type typeCheck(Map<String, IdProperties> symTable);
}
