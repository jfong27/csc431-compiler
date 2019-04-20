package ast;

import java.util.Map;

public interface Expression
{
   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable);
   public Value addInstructions(Block node, Map<String, IdProperties> symTable, 
                                Map<String, Map<String, Type>> structTable);
}
