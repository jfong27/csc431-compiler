package ast;

import java.lang.StringBuilder;

import java.util.List;

public class TypeDeclaration
{
   private final int lineNum;
   private final String name;
   private final List<Declaration> fields;

   public TypeDeclaration(int lineNum, String name, List<Declaration> fields)
   {
      this.lineNum = lineNum;
      this.name = name;
      this.fields = fields;
   }

   public String getName() {
      return name;
   }

   public List<Declaration> getFields() {
      return fields;
   }

   public String toString() {
      StringBuilder sb = new StringBuilder();

      sb.append("%struct.");
      sb.append(name);
      sb.append(" = type {");

      for (Declaration decl : fields) {
         sb.append(decl.toString() + ", ");
      }

      sb.delete(sb.length() - 2, sb.length());
      sb.append("}\n");

      return sb.toString();
      
   }

}
