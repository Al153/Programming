import java.io.{File, PrintWriter}

import BackEnd.CompileAST
import Parsing.Parser
import Parsing.SyntaxTree.{CSTToAST, Type}

import scala.collection.immutable.HashMap
import scala.io.Source


/**
  * Created by Al on 11/03/2017.
  */
object Main {
	def main(args: Array[String]): Unit ={

			val cfg = getClass.getResourceAsStream("/slang.spec")
      val input = parseArgs(args)
      input.get("Message") match {
        case Some(s) => println(s)
        case None => { // no message means actually compile
          val sourceFile = input("Source")
          val outputFile = input("Output")
          ifFileExists(sourceFile, (source: String) => {
            val CST = new Parser(Source.fromInputStream(cfg).mkString).parseString(source)
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
      }
	}

	private def ifFileExists(name: String, cnt: String => Unit): Unit = {
		if (new File(name).exists){
			val fileString = Source.fromFile(name).mkString
			cnt(fileString)
		} else {
			print("File " + name + " does not exist.")
		}
	}

  val usage = "usage: <SlangCOmpiler> sourceFile [-o outputFile]"

  private def parseArgs(args: Array[String]): Map[String, String] ={
    var parseResult = new HashMap[String, String]
    if (args.length == 0) {
      parseResult += ("Message" -> usage)

      parseResult
    } else {
      parseResult += ("Source" -> args(0))
      if (args.length > 1){
        args(1) match {
          case "-o" =>
            if (args.length == 3){
              parseResult += ("Output" -> args(2))
              parseResult
            } else {
              parseResult += ("Message" -> usage)

              parseResult
            }

          case _ =>
            parseResult += ("Message" -> usage)


            parseResult
        }
      } else {
        parseResult += ("Output" -> getDefaultOutputFile(args(0)))

        parseResult
      }
    }
  }

  private def getDefaultOutputFile(source: String): String = source.replaceAll("\\.[^.]*$", "") + ".byte"
}
