package Parsing

import Logging.PrettyPrinter
import Exceptions._
import Parsing.SyntaxTree.{ConcreteSyntaxTree, NonTerminal, Terminal}

class Parser(var config: String) {
  val configuration:ParserConfiguration = new ParserConfiguration(config)
  val lexer: Lexer = configuration.getLexer
  val gotoTable: Map[(Int, String), Int] = configuration.getGotoTable
  val actionTable: Map[(Int, String), ParserAction] = configuration.getLookaheadActionTable

  def parseString(input:String): ConcreteSyntaxTree = {
    var tokens = lexer.lex(input)
    tokens = tokens :+ Terminal("END", "END")
    val sentinel = NonTerminal("SENTINEL", Nil)
    sentinel.setState(0)
    val stack:List[ConcreteSyntaxTree] = List(sentinel)
    doParse(tokens, stack, tokens)
  }

  private def doParse(
                       inputStream: List[Terminal],
                       stack: List[ConcreteSyntaxTree],
                       fullTokens: List[Terminal],
                       tokenPtr: Int = 0
                     ) : ConcreteSyntaxTree = {
    stack match {
      case Nil => throw EmptyParseStackException()
      case top :: _ => actionTable.getOrElse((top.getState, inputStream.head.nodeType), ActionError) match {
        case ActionError => throwSyntaxError(inputStream, fullTokens.take(tokenPtr), stack)
        case Shift(state) =>
          inputStream.head.setState(state)
          inputStream match {
            case Nil => throw EndOfStreamError()
            case _ => doParse(inputStream.tail, inputStream.head :: stack, fullTokens, tokenPtr + 1)
          }
        case Reduce(rule) =>
          val length = rule.rhs.length
          val newChildren = stack.take(length).reverse
          val newStack = stack.drop(length)
          val newTop = NonTerminal(rule.lhs, newChildren)
          val newState: Option[Int] = gotoTable.get((newStack.head.getState, rule.lhs))
          if (rule.lhs == "GOAL"){ // We need to check for done during the reduce step according to parser generator
            newTop
          } else {
            newState match {
              case None => throw UnknownGotoException(newTop, newStack.head.getState)
              case Some(s) =>
                newTop.setState(s)
                doParse(inputStream, newTop::newStack, fullTokens, tokenPtr + 1)
            }
          }
        case Done => top


      }
    }
  }

  private def throwSyntaxError(inputStream: List[Terminal], previous: List[Terminal], stack: List[ConcreteSyntaxTree]): ConcreteSyntaxTree ={
    val lookahead = inputStream.head
    val rest = inputStream.tail.take(10)
    val lengthToDrop = max(previous.length - 10, 0)
    val past = previous.drop(lengthToDrop)
    val pretty = (x:Terminal)=>x.value
    val fullPrint = (x:ConcreteSyntaxTree) => x.pretty()
    val state = stack.head.getState
    val msg = stack.map(fullPrint) + "\n"+
      past.map(pretty).mkString +
      "\t[[[" + lookahead.nodeType + " (" + pretty(lookahead) + ") " + "]]]\t" +
      rest.map(pretty).mkString + "\n" +
      "State: " + state + "expected tokens: " + getExpectedTransitions(state)

    throw SlangSyntaxError(msg)
  }

  def getExpectedTransitions(state: Int): String ={
    var expectedList: List[String] = Nil
    for (((n, token), _) <- actionTable){
      if (n == state){
        expectedList = token :: expectedList
      }
    }
    "[" + expectedList.mkString(", ") + "]"
  }

  private def prettyActionTable(indent:Int = 0): String ={
    var str = ""
    for (((state,token),action) <- actionTable){
      str += PrettyPrinter.indentation(indent) + state + "\t-"+ token + "->\t"+ action + "\n"
    }
    str
  }

  private def prettyGotoTable(indent: Int = 0): String = {
    var str = ""
    for (((state, token), nextState) <- gotoTable){
      str += PrettyPrinter.indentation(indent) + state + "\t-"+ token + "->\t"+ nextState + "\n"
    }
    str
  }

  private def max(a: Int, b: Int): Int =if(a>b) a else b
}






