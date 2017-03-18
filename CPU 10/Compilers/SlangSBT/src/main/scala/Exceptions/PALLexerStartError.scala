package Exceptions

/**
  * Created by Al on 12/03/2017.
  */
class PALLexerStartError(name: String, cause: Throwable = null)
  extends Exception("PAL lexer definition for token " + name + " is missing a start token ", cause)
