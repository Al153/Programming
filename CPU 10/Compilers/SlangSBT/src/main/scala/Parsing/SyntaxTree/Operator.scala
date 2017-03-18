package Parsing.SyntaxTree

import Logging.PrettyPrinter
import Exceptions.SlangTypeError

sealed trait Operator {
  def pretty(indent: Int): String
  def getType(t1: Type, t2: Type): Type
}
case class ADD() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "ADD"
  }

  override def getType(t1: Type, t2: Type): Type =  {
    (t1, t2) match {
      case (TSimple(TInt()), TSimple(TInt())) => TSimple(new TInt)
      case _ => throw new SlangTypeError("Operator +  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}
case class MUL() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "MUL"
  }
  override def getType(t1: Type, t2: Type): Type = {
    (t1, t2) match {
      case (TSimple(TInt()), TSimple(TInt())) => TSimple(new TInt)
      case _ => throw new SlangTypeError("Operator *  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}
case class SUB() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "SUB"
  }
  override def getType(t1: Type, t2: Type): Type = {
    (t1, t2) match {
      case (TSimple(TInt()), TSimple(TInt())) => TSimple(new TInt)
      case _ => throw new SlangTypeError("Operator -  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}
case class LT() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "LESS THAN"
  }
  override def getType(t1: Type, t2: Type): Type = {
    (t1, t2) match {
      case (TSimple(TInt()), TSimple(TInt())) => TSimple(new TBool)
      case _ => throw new SlangTypeError("Operator <  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}
case class AND() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "AND"
  }

  override def getType(t1: Type, t2: Type): Type = {
    (t1, t2) match {
      case (TSimple(TBool()), TSimple(TBool())) => TSimple(new TBool)
      case _ => throw new SlangTypeError("Operator &&  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}
case class OR() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "OR"
  }

  override def getType(t1: Type, t2: Type): Type = {
    (t1, t2) match {
      case (TSimple(TBool()), TSimple(TBool())) => TSimple(new TBool)
      case _ => throw new SlangTypeError("Operator ||  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}

case class EQ() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "EQUALS(INT)"
  }

  override def getType(t1: Type, t2: Type): Type = {
    (t1, t2) match {
      case (TSimple(TBool()), TSimple(TBool())) => TSimple(new TBool)
      case (TSimple(TInt()), TSimple(TInt())) => TSimple(new TBool)
      case _ => throw new SlangTypeError("Operator =  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}