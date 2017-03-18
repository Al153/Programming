/**
  * Created by Al on 10/03/2017.
  */
case class UnrecognisedTokenException(tokenName: String, cause: Throwable = null)
  extends Exception("Unrecognised token: "+tokenName, cause)

case class NoStateException(stackValue: ConcreteSyntaxTree, cause: Throwable = null)
  extends Exception("State on stack has no state value: "+stackValue.nodeType, cause)

case class EmptyParseStackException(message: String = "Error, parse stack is empty", cause: Throwable = null)
  extends Exception(message, cause)

case class SlangSyntaxError(
                             lookahead: Terminal,
                             inputStream: List[Terminal],
                             stack: List[ConcreteSyntaxTree],
                             cause: Throwable = null
                           )
  extends Exception("Error: Syntax error near ... ", cause)

case class EndOfStreamError()
  extends  Exception("Error: unexpected end of input stream")

case class UnknownGotoException(n: NonTerminal, cause: Throwable = null)
  extends Exception("Error, do not know what to do with NT token: "+ n.nodeType, cause)