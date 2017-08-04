package Exceptions

/**
  * Created by Al on 12/03/2017.
  */
case class PALLexerStartError(name: String)
  extends Throwable {
  override def toString: String = "PAL lexer definition for token " + name + " is missing a start token "
}
