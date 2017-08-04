package Parsing

import Logging.PrettyPrinter
import Parsing.DFA.DFA
import Exceptions.UnrecognisedTokenException
import Parsing.SyntaxTree.Terminal
import play.api.libs.json.JsObject

/**
  * Created by Al on 09/03/2017.
  */
class Lexer(configuration: JsObject, ruleNames: List[String], elementaryTokens: List[String], toIgnore: List[String]){
  val dfas:Map[String,DFA] = new LexerConfiguration(configuration, ruleNames).getDFAs

  def lex(s: String) : List[Terminal] = {
    val tokens = split(s)
    val getToken: (Token => Terminal) = {case UnParsedToken(string, c, r) => pickToken(string, ruleNames, c, r)}
    tokens.map(getToken)
  }

  def pretty(indent: Int = 0): String =
    dfas.map{pair => val (name, dfa) = pair; s"${PrettyPrinter.indentation(indent) + name}:\n${dfa.pretty(indent)}"}.mkString("")


  def pickToken(s: String, rs: List[String], col: Int, row: Int) : Terminal = {
    rs match {
      case (r: String)::rss =>
        dfas.get(r) match {
          case None => pickToken(s, rss, col, row)
          case Some(dfa) => if (dfa.matchString(s)) {
            Terminal(r, s).rowIs(row).colIs(col)
          }else{
            pickToken(s, rss, col, row)
          }
        }
      case Nil => throw UnrecognisedTokenException(s)
    }
  }

  def split(s: String) : List[Token] = {
    split(s.toList, Nil, Nil, 1, 1).reverse
  }

  private def split(s: List[Char], currentToken: List[Char], tokens: List[Token], row: Int, col: Int) : List[Token] = {
    val tokenAsString: String = currentToken.reverse.mkString
    s match {
      case Nil => if (isIgnorable(currentToken)){
        tokens
      } else {
        UnParsedToken(tokenAsString, row, col) :: tokens
      }
      case c::cs =>
        val (newRow, newCol) =
          if (c=='\n'){
            (row+1, 0)
          } else {
            (row, col+1)
          }

        if (isElementaryToken(c)){
          var newTokens =
            if (!isIgnorable(currentToken)){
              UnParsedToken(tokenAsString, row, col) :: tokens
            } else {
              tokens
            }
          newTokens =
            if (isIgnorable(List(c))){
              newTokens
            } else {
              UnParsedToken(c.toString, row, col) :: newTokens
            }
          split(cs, Nil, newTokens, newRow, newCol)
        } else {
          split(cs, c::currentToken, tokens,  newRow, newCol)
        }
    }

  }

  private def isElementaryToken(c: Char) : Boolean = elementaryTokens.contains(c.toString)

  private def isIgnorable(token: List[Char]) : Boolean = {
    val tokenAsString: String = token.reverse.mkString
    toIgnore.contains(tokenAsString)  || tokenAsString.isEmpty
  }
}





