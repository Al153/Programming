package Intermediate

import Exceptions.SlangTypeError
import Logging.PrettyPrinter
import Typing._

sealed trait UnaryOperator{
  def pretty(indent: Int): String
  def getType(t: Type): Type

}
case class NEG() extends UnaryOperator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "NEGATE"
  }

  override def getType(t: Type): Type = {
    if  (t.unify(TSimple(TInt()))) {
      TSimple(new TInt)
    } else {
      throw SlangTypeError("Unary Operator -  does not take argument of type: " + t.pretty())
    }
  }
}
case class NOT() extends UnaryOperator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "NOT"
  }

  override def getType(t: Type): Type = {
    if  (t.unify(TSimple(TBool()))) {
      TSimple(new TBool)
    } else {
      throw SlangTypeError("Unary Operator ~ does not take argument of type: " + t.pretty())
    }
  }
}
case class READ() extends UnaryOperator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "INPUT"
  }
  override def getType(t: Type): Type = {
    if  (t.unify(TSimple(TUnit()))) {
      TSimple(new TInt)
    } else {
      throw SlangTypeError("Unary Operator ? does not take argument of type: " + t.pretty())
    }
  }
}