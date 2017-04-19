package Parsing.SyntaxTree

import BackEnd.newLabel
import Logging.PrettyPrinter

class Lambda(bound: String, e: AST, t: Type) {
  def pretty(indent: Int = 0): String = {
    val i = PrettyPrinter.indentation(indent)
    i + "LAMBDA " + bound + "(" + t.pretty() + "){\n" + e.pretty(indent + 1) + "\n" + i + "}"
  }
  def getExpr : AST = e
  def getArg: String = bound
  private var T: Option[Type] = None
  def getType(gamma: Map[String, Type]): Type = {
    T match {
      case Some(t1) => t1
      case None =>
        val newT = TFn(t, e.getType(gamma + (bound -> t)))
        T = Some(newT)
        newT
    }
  }
  def getArgType: Type = t
  def alpha(oldName: String, newName: String): Lambda = {
    if (oldName == bound) { // if bound variable has the same name as hte one to change,
                            // then all instances of oldName are actually instances of bound
      this
    } else { // otherwise
      val (checkedExpr, checkedBound) =
        if (newName == bound){  // if newName = bound, then we need to first change all instances of bound to something else to avoid introducing conflict
          val newBound = newLabel.apply
          (e.alpha(bound, newBound), newBound)
        } else {
          (e,bound)
        }

      new Lambda(checkedBound, checkedExpr.alpha(oldName, newName), t)
    }
  }
}