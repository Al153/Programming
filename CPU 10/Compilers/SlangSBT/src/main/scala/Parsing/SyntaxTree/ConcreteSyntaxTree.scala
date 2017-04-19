package Parsing.SyntaxTree

import Logging.PrettyPrinter
import Exceptions.NoStateException

/**
  * Created by Al on 10/03/2017.
  */


sealed abstract class ConcreteSyntaxTree(val nodeType: String) {
  var state: Option[Int] = None
  def setState(i: Int) : Unit = {state = Some(i)}
  def getState : Int  = state match {
    case None => throw NoStateException(this)
    case Some(i) => i
  }

  def pretty(indent: Int = 0) : String
  protected val indentation: (Int => String) = (n:Int) => PrettyPrinter.indentation(n)
}
case class Terminal(override val nodeType: String, value: String)
  extends ConcreteSyntaxTree(nodeType) {
  override def pretty(indent: Int = 0) : String = {
    indentation(indent) + nodeType + "(" + value + ")"
  }
}
case class NonTerminal(override val nodeType: String, children: List[ConcreteSyntaxTree])
  extends ConcreteSyntaxTree(nodeType) {
  override def pretty(indent: Int = 0) : String = {

    var str = indentation(indent) + nodeType + "{\n"
    for (child <- children){
      str += child.pretty(indent+1) + "\n"
    }

    str + PrettyPrinter.indentation(indent) + "}"
  }
}