import java.io.{File, PrintWriter}

import BackEnd.CompileAST
import Intermediate.CSTTranslator
import Intermediate.Creole.CreoleTranslator
import Intermediate.Prototype.PrototypeTranslator
import Intermediate.Slang.SlangTranslator
import Parsing.Parser
import Typing.Type

import scala.collection.immutable.HashMap
import scala.io.Source


/**
  * Created by Al on 11/03/2017.
  * This is a compiler for the Slang language as demonstrated in the Cambridge computer lab compiler construction course
  * I am currently extending slang into a Hindley-Milner type system language
  */
object Main {
	def main(args: Array[String]): Unit ={
    val commandLineConfig = new CommandLineConfig(args)



    val language = commandLineConfig.lang()
    val sourceFile = commandLineConfig.source()
    val outputFile = commandLineConfig.destination()
    val cfg = getClass.getResourceAsStream("/"+ language + ".spec")

    val GetCSTTranslator: HashMap[String, CSTTranslator] = new HashMap[String, CSTTranslator] + (
      "slang" -> new SlangTranslator,
      "creole" -> new CreoleTranslator,
      "PrototypeTypingSyntax" -> new PrototypeTranslator
    )

    val CSTToAST = GetCSTTranslator(language)

    ifFileExists(sourceFile, (source: String) => {
      val CST = new Parser(Source.fromInputStream(cfg).mkString).parseString(source)
      println("Parse done")
      val AST = CSTToAST(CST)
      println("CST = " + CST.pretty())
      println("AST = " + AST.pretty())
      println("Type = " + AST.getType(new HashMap[String, Type]).pretty())
      val byteCode = CompileAST(AST)
      println("Bytecode = \n" + byteCode)
      val pw = new PrintWriter(new File(outputFile))
      pw.write(byteCode)
      pw.close()
    })
	}

	private def ifFileExists(name: String, cnt: String => Unit): Unit = {
		if (new File(name).exists){
			val fileString = Source.fromFile(name).mkString
			cnt(fileString)
		} else {
			print("File " + name + " does not exist.")
		}
	}

}
