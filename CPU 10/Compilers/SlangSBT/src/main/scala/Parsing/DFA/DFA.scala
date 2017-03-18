package Parsing.DFA

import Logging.PrettyPrinter

/**
  * Created by Al on 12/03/2017.
  */
class DFA(private var states: Map[Int, DFAState], private var start: Int){
  def matchString(s:String):Boolean = {
    matchString(s.toList, start)
  }

  private def matchString(s: List[Char], state: Int) : Boolean = {

    s match {
      case Nil => states.get(state) match {
        case Some(dfaState) => dfaState.getAccept
      }
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

  def pretty(indent:Int = 0 ) : String = {
    var  str: String = PrettyPrinter.indentation(indent)
    for ((i, state) <- states){
      str += state.pretty(indent + 1)
    }
    str
  }
}
