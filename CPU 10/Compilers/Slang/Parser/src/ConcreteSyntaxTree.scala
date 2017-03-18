/**
  * Created by Al on 10/03/2017.
  */
sealed abstract class ConcreteSyntaxTree(val nodeType: String) {
  var state: Option[Int] = None
  def setState(i: Int) = state = Some(i)
  def getState = state match {
    case None => throw NoStateException(this)
    case Some(i) => i
  }
}
case class Terminal(override val nodeType: String, value: String)
  extends ConcreteSyntaxTree(nodeType)
case class NonTerminal(override val nodeType: String, children: List[ConcreteSyntaxTree])
  extends ConcreteSyntaxTree(nodeType)