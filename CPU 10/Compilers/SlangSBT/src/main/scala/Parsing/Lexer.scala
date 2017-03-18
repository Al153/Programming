package Parsing

import Logging.PrettyPrinter
import Parsing.DFA.DFA
import Exceptions.UnrecognisedTokenException
import Parsing.SyntaxTree.Terminal
import play.api.libs.json.JsObject

/**
  * Created by Al on 09/03/2017.
  */
class Lexer(configuration :JsObject, ruleNames:List[String], elementaryTokens:List[String], toIgnore:List[String]){
  val dfas:Map[String,DFA] = new LexerConfiguration(configuration, ruleNames).getDFAs

  def lex(s: String) : List[Terminal] = {
    val tokens = split(s)
    val getToken = (s:String) => pickToken(s, ruleNames)
    tokens.map(getToken)
  }

  def pretty(indent: Int = 0): String ={
    var str = ""
    for ((name, dfa) <- dfas){
      str += PrettyPrinter.indentation(indent) + name + ":\n"
      str += dfa.pretty(indent)
    }
    str
  }

  def pickToken(s: String, rs: List[String]) : Terminal = {
    rs match {
      case (r: String)::rss =>
        dfas.get(r) match {
          case None => pickToken(s, rss)
          case Some(dfa) => if (dfa.matchString(s)) {
            Terminal(r, s)
          }else{
            pickToken(s, rss)
          }
        }
      case Nil => throw new UnrecognisedTokenException(s)
    }
  }
  def split(s: String) : List[String] = {
    split(s.toList, Nil, Nil).reverse
  }

  private def split(s: List[Char], currentToken: List[Char], tokens: List[String]) : List[String] = {
    val tokenAsString: String = currentToken.reverse.mkString
    s match {
      case Nil => if (isIgnorable(currentToken)){
        tokens
      } else {
        tokenAsString :: tokens
      }
      case c::cs => if (isElementaryToken(c)){
        var newTokens =  if (!isIgnorable(currentToken)){
          tokenAsString :: tokens
        } else {
          tokens
        }
        newTokens = if (isIgnorable(List(c))){
          newTokens
        } else {
          c.toString :: newTokens
        }
        split(cs, Nil, newTokens)
      } else {
        split(cs, c::currentToken, tokens)
      }
    }

  }

  private def isElementaryToken(c: Char) : Boolean = elementaryTokens.contains(c.toString)

  private def isIgnorable(token: List[Char]) : Boolean = {
    val tokenAsString: String = token.reverse.mkString
    toIgnore.contains(tokenAsString)  || tokenAsString.isEmpty
  }
}



