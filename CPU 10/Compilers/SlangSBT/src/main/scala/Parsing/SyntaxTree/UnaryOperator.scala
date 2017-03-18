package Parsing.SyntaxTree

import Logging.PrettyPrinter
import Exceptions.SlangTypeError

sealed trait UnaryOperator{
  def pretty(indent: Int): String
  def getType(t: Type): Type

}
case class NEG() extends UnaryOperator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "NEGATE"
  }

  override def getType(t: Type): Type = {
    t match {
      case TSimple(TInt()) => TSimple(new TInt)
      case _ => throw new SlangTypeError("Unary Operator -  does not take argument of type: " + t.pretty())
    }
  }
}
case class NOT() extends UnaryOperator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "NOT"
  }

  override def getType(t: Type): Type = {
    t match {
      case TSimple(TBool()) => TSimple(new TBool)
      case _ => throw new SlangTypeError("Unary Operator ~  does not take argument of type: " + t.pretty())
    }
  }
}
case class READ() extends UnaryOperator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "INPUT"
  }
  override def getType(t: Type): Type = {
    t match {
      case TSimple(TUnit()) => TSimple(new TInt)
      case _ => throw new SlangTypeError("Unary Operator ?  does not take argument of type: " + t.pretty())
    }
  }
}