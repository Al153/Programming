package Prototyping

import Intermediate.Lambda

/**
  * Created by Al on 20/06/2017.
  */
sealed trait Pattern extends Ordered[Pattern] {}  // Subclasses of this trait represent higher level patterns
  case class GroundPattern(p: PatternValue) extends Pattern(){

    override def compare(that: Pattern): Int = that match {
      case GroundPattern(tp) => p.compare(tp)
      case CompositePattern(_, _) => -1
    }
}
  case class CompositePattern(constructor: String, terms: List[Pattern]) extends Pattern(){
    // Ref, tuples are special cases of this
    override def compare(that: Pattern): Int = that match {
      case GroundPattern(_) => 1
      case CompositePattern(tc, tl) =>
        if (constructor != tc) {
          constructor.compare(tc)
        } else if (terms.length != tl.length){
          terms.length - tl.length
        } else {
          terms.zip(tl).foldLeft(0){(x, pair) => if (x == 0) pair._1.compare(pair._2) else x}
        }
    }
  }


sealed trait PatternValue extends Ordered[PatternValue] {} // represent values
  case class IntValue(i: Int) extends PatternValue{
    override def compare(that: PatternValue): Int = that match {
       case IntValue(ti) => i - ti // compare ints
       case VariableValue(_) => -1 // values come before variables
       case BoolValue(_) => throw PatternTypeException()
     }
}
  case class BoolValue(b: Boolean) extends PatternValue{
    override def compare(that: PatternValue): Int = that match {
      case BoolValue(tb) => toInt(b) - toInt(tb) // pick arbitary order
      case VariableValue(_) => -1 // values come before variables
      case IntValue(_) => throw PatternTypeException()

    }
    private def toInt(b: Boolean) = if (b) 1 else 0
  }

case class VariableValue(x: String) extends PatternValue {
  override def compare(that: PatternValue): Int = that match {
    case VariableValue(tx) => x.compare(tx) // test by name
    case _ => 1 // comes after any fixed value
  }
}


class TranslatedPattern(ps: List[(Pattern, Lambda)]) {
  val results: List[(PatternHeader, Lambda)] = List()
  // This class wants to handle the transition from a multi level, complex set of patterns to match, to AST
  // code for individual decisions.
  // Ie a test for matching

    // Foo(Spam(eggs)) -> something(eggs)
    // | Bar(1, Badger(mushroom)) -> snake

  // should be translated along the lines of
  // TestHeader(Foo: l1, Bar: l2)
  // l1:
    // testHeader(Spam: l3)
  // l2:
    // fst
  // etc
}

sealed abstract class PatternHeader() {} // Lower level byte code header
  case class IntHeader(i: Int) extends PatternHeader() {}
  case class BoolHeader(b: Boolean) extends PatternHeader() {}
  case class HeaderHeader(h: String) extends PatternHeader() {}

/* case */ class SPatternMatch() /* extends AST */ {
  def pretty(indent: Int = 0): String ={
    ""
  }
}

object prototyping {

}

case class PatternTypeException(cause: Throwable = null) extends Exception("Programming error:" +
  "should not be comparing two pattern values of different types", cause)