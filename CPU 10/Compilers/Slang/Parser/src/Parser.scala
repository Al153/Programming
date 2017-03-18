
/**
  * Created by Al on 09/03/2017.
  */
class Parser(var config: String) {
  getConfig()
  val lexer: Lexer = null
  val gotoTable: Map[(Int, String), Int] = null
  val actionTable: Map[(Int, String), ParserAction] = null

  def parse(input:String): ConcreteSyntaxTree = {
    var tokens = lexer.lex(input)
    tokens = tokens :+ Terminal("END", "END")
    val stack =  Nil
    doParse(tokens, stack)
  }

  private def doParse(
                       inputStream: List[Terminal],
                       stack: List[ConcreteSyntaxTree]
                     ) : ConcreteSyntaxTree = {
    stack match {
      case Nil => throw EmptyParseStackException()
      case top :: _ => actionTable.getOrElse((top.getState, inputStream.head.nodeType), ActionError) match {
        case ActionError => throw SlangSyntaxError(inputStream.head, inputStream, stack)
        case Shift(state) =>
          inputStream.head.setState(state)
            inputStream match {
              case Nil => throw EndOfStreamError()
              case _ => doParse(inputStream.tail, inputStream.head :: stack)
            }
        case Reduce(rule) =>
          val length = rule.rhs.length
          val newChildren = stack.take(length)
          val newStack = stack.drop(length)
          val newTop = NonTerminal(rule.lhs.nodeType, newChildren)
          val newState: Option[Int] = gotoTable.get((stack.head.getState, rule.lhs.nodeType))

          newState match {
            case None => throw UnknownGotoException(newTop)
            case Some(s) =>
              newTop.setState(s)
              doParse(inputStream.tail, newTop::newStack)
          }
        case Done => top


      }
    }

  }

  private def getConfig(): Unit ={

  }
}






