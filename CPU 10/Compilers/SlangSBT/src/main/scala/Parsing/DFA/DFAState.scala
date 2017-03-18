package Parsing.DFA

import Logging.PrettyPrinter

/**
  * Created by Al on 12/03/2017.
  */
class DFAState(private var stateNumber:Int, private var gotoStates:Map[Char,Int], private var accept:Boolean){
  def getNext(c:Char): Option[Int] = gotoStates.get(c)
  def getStateNumber: Int = stateNumber
  def getAccept: Boolean = accept
  def setAccept(b :Boolean) = {accept = b}

  def pretty(indent:Int = 0): String = {
    var indentation = PrettyPrinter.indentation(indent)
    var str = indentation + stateNumber.toString
    for ((c, state) <- gotoStates){
      str += indentation + "\t-" + c + "-> " + state.toInt + "\n"
    }
    str
  }
}
