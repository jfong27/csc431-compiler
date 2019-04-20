package ast;

import java.util.Map;

public interface Statement
{
   public Type typeCheck(Map<String, IdProperties> symTable,
                         Map<String, Map<String, Type>> structTable,
                         Type retType);
   public Block createCFG(Block entry, Block exit, 
                          Map<String, IdProperties> symTable, 
                          Map<String, Map<String, Type>> structTable);

   public boolean doesReturn();

}
