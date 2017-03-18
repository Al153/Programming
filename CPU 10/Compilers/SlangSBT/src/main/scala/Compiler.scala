import java.io.File

import Parsing.Parser
import Parsing.SyntaxTree.{CSTToAST, Type}

import scala.collection.immutable.HashMap
import scala.io.Source

/**
  * Created by Al on 11/03/2017.
  */
object Main {
	def main(args: Array[String]): Unit ={
		if (args.length > 1){
			val configFile =  args(0)
			val sourceFile = args(1)
			ifFileExists(configFile, (cfg: String ) =>{
				ifFileExists(sourceFile, (source: String) => {
					val CST = new Parser(cfg).parseString(source)
					val AST = CSTToAST(CST)
          println("CST = " + CST.pretty())
          println("AST = " + AST.pretty())
					println("Type = " + AST.getType(new HashMap[String, Type]).pretty())
				})
			})
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
}
