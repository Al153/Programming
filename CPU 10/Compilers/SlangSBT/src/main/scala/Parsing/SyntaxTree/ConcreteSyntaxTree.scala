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
  protected val indentation: Int => String = PrettyPrinter.indentation
}
case class Terminal(override val nodeType: String, value: String)
  extends ConcreteSyntaxTree(nodeType) {
  private var row = 0
  private var col = 0
  override def pretty(indent: Int = 0) : String = {
    indentation(indent) + nodeType + "(" + value + ")"
  }
  def rowIs(r: Int): Terminal = {
    row = r
    this
  }
  def colIs(c: Int): Terminal = {
    col = c
    this
  }

  def getCol: Int = col
  def getRow: Int = row
}
case class NonTerminal(override val nodeType: String, children: List[ConcreteSyntaxTree])
  extends ConcreteSyntaxTree(nodeType) {
  override def pretty(indent: Int = 0) : String =
    indentation(indent) + nodeType + "{\n" + children.map(_.pretty(indent+1)).mkString("\n") + indentation(indent) + "}"
}