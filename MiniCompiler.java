import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

import ast.StructProperties;
import ast.Type;
import java.io.*;
import javax.json.JsonValue;
import java.util.List;
import java.util.Map;


public class MiniCompiler
{
   private static boolean stack = false;
   private static String _inputFile = null;
   
   public static void main(String[] args) throws IOException
   {
      parseParameters(args);
      CommonTokenStream tokens = new CommonTokenStream(createLexer());
      MiniParser parser = new MiniParser(tokens);
      ParseTree tree = parser.program();
      if (parser.getNumberOfSyntaxErrors() == 0)
      {
         /*
            This visitor will create a JSON representation of the AST.
            This is primarily intended to allow use of languages other
            than Java.  The parser can thusly be used to generate JSON
            and the next phase of the compiler can read the JSON to build
            a language-specific AST representation.
         */
         //MiniToJsonVisitor jsonVisitor = new MiniToJsonVisitor();
         //JsonValue json = jsonVisitor.visit(tree);
         //System.out.println(json);

         /*
            This visitor will build an object representation of the AST
            in Java using the provided classes.
         */
         MiniToAstProgramVisitor programVisitor =
            new MiniToAstProgramVisitor();
         ast.Program program = programVisitor.visit(tree);
      
         Map<String, StructProperties> structTable = program.typeCheck();

         
         //String inputName = args[0].substring(0, args[0].length() - 5);
         String inputName = _inputFile.substring(0, _inputFile.length() - 5);
         String[] path = inputName.split("/");
         inputName = path[path.length - 1];
         BufferedWriter out;
         String programString;
         if (true) { //-stack was provided in command line
            programString = program.toString(structTable);
            System.out.println(programString);
            out = new BufferedWriter(new FileWriter(inputName + ".ll"));
         } else { //-stack was NOT provided in command line
            //TODO
            programString = "";
            //programString = program.toStringSsa(structTable)
            out = new BufferedWriter(new FileWriter(inputName + "_ssa.ll"));
         }
         try {
            out.write(programString);
         } catch (IOException e) {
            System.out.println(e);
         } finally {
            out.close();
         }
         
      }
   }

   private static void parseParameters(String[] args)
   {
      for (int i = 0; i < args.length; i++)
      {
         if (args[i].equals("-stack"))
         {
            stack = true;
         }
         else if (args[i].charAt(0) == '-')
         {
            System.err.println("unexpected option: " + args[i]);
            System.exit(1);
         }
         else if (_inputFile != null)
         {
            System.err.println("too many files specified");
            System.exit(1);
         }
         else
         {
            _inputFile = args[i];
         }
      }
   }

   private static void error(String msg)
   {
      System.err.println(msg);
      System.exit(1);
   }

   private static MiniLexer createLexer()
   {
      try
      {
         CharStream input;
         if (_inputFile == null)
         {
            input = CharStreams.fromStream(System.in);
         }
         else
         {
            input = CharStreams.fromFileName(_inputFile);
         }
         return new MiniLexer(input);
      }
      catch (java.io.IOException e)
      {
         System.err.println("file not found: " + _inputFile);
         System.exit(1);
         return null;
      }
   }
}
