package Parsing.SyntaxTree

import Logging.PrettyPrinter

class Lambda(bound: String, e: AST, t: Type) {
  def pretty(indent: Int = 0): String = {
    val i = PrettyPrinter.indentation(indent)
    i + "LAMBDA " + bound + "(" + t.pretty() + "){\n" + e.pretty(indent + 1) + "\n" + i + "}"
  }
  def getExpr : AST = e
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
}