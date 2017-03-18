
/**
  * Created by Al on 09/03/2017.
  */
class Lexer(dfaSettings:String, ruleNames:List[String], elementaryTokens:List[String], toIgnore:List[String]){
  val dfas:Map[String,DFA] = null // Todo: change me!

  def lex(s: String) : List[Terminal] = {
    val tokens = split(s)
    val getToken = (s:String) => pickToken(s, ruleNames)
    tokens.map(getToken)
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
    val tokenAsString: String = currentToken.reverse.toString()
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
    val tokenAsString: String = token.reverse.toString()
    toIgnore.contains(tokenAsString)  || tokenAsString.isEmpty
  }
}

class DFA(private var states: Map[Int, DFAState], private var start: Int){
  def matchString(s:String):Boolean = {
    matchString(s.toList, start)
  }

  private def matchString(s: List[Char], state: Int) : Boolean = {

    s match {
      case Nil => true
      case c::cs =>
        val next: Option[Int] = states.get(state) match {
          case None => None
          case Some(dfaState) => dfaState.getNext(c)
        }

        next match {
          case None => false
          case Some(newState) => matchString(cs, newState)
        }
    }
  }
}

class DFAState(private var stateNumber:Int, private var gotoStates:Map[Char,Int], private var accept:Boolean){
  def getNext(c:Char): Option[Int] = gotoStates.get(c)
  def getStateNumber: Int = stateNumber
  def getAccept: Boolean = accept
}