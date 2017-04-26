package Intermediate

import Exceptions.SlangTypeError
import Logging.PrettyPrinter
import Typing._

sealed trait Operator {
  def pretty(indent: Int): String
  def getType(t1: Type, t2: Type): Type
}
case class ADD() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "ADD"
  }

  override def getType(t1: Type, t2: Type): Type =  {
    if (t1.unify(TSimple(TInt())) && t2.unify(TSimple(TInt()))) {
      TSimple(new TInt)
    } else {
      throw new SlangTypeError("Operator +  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}
case class MUL() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "MUL"
  }
  override def getType(t1: Type, t2: Type): Type = {
    if (t1.unify(TSimple(TInt())) && t2.unify(TSimple(TInt()))) {
      TSimple(new TInt)
    } else {
      throw new SlangTypeError("Operator *  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}
case class SUB() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "SUB"
  }
  override def getType(t1: Type, t2: Type): Type = {
    if (t1.unify(TSimple(TInt())) && t2.unify(TSimple(TInt()))) {
      TSimple(new TInt)
    } else {
      throw new SlangTypeError("Operator -  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}
case class LT() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "LESS THAN"
  }
  override def getType(t1: Type, t2: Type): Type = {
    if (t1.unify(TSimple(TInt())) && t2.unify(TSimple(TInt()))) {
      TSimple(new TBool)
    } else {
      throw new SlangTypeError("Operator < does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}
case class AND() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "AND"
  }

  override def getType(t1: Type, t2: Type): Type = {
    if (t1.unify(TSimple(TBool())) && t2.unify(TSimple(TBool()))) {
      TSimple(new TBool)
    } else {
      throw new SlangTypeError("Operator && does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}
case class OR() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "OR"
  }

  override def getType(t1: Type, t2: Type): Type = {
    if (t1.unify(TSimple(TBool())) && t2.unify(TSimple(TBool()))) {
      TSimple(new TBool)
    } else {
      throw new SlangTypeError("Operator && does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}

case class EQ() extends Operator {
  override def pretty(indent: Int = 0): String = {
    PrettyPrinter.indentation(indent) + "EQUALS(INT)"
  }

  override def getType(t1: Type, t2: Type): Type = {
    // Difficulty here:
      // we can't unbind a unification once it's done
      // so we can't backtrack if a unification fails but we have instatiated variables
    t1.prune() match {
      case TSimple(TBool()) =>
        if (t2.unify(TSimple(new TBool))) {
          TSimple(new TBool)
        } else {
          throw new SlangTypeError("Operator =  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
        }
      case TSimple(TInt()) =>
        if (t2.unify(TSimple(new TInt))) {
          TSimple(new TBool)
        } else {
          throw new SlangTypeError("Operator =  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
        }
      case TVariable() =>
        t2.prune() match {
          case TSimple(TBool()) =>
            if (t1.unify(TSimple(new TBool))) {
              TSimple(new TBool)
            } else {
              throw new SlangTypeError("Operator =  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
            }
          case TSimple(TInt()) =>
            if (t1.unify(TSimple(new TInt))) {
              TSimple(new TBool)
            } else {
              throw new SlangTypeError("Operator =  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
            }
          case TVariable() =>
            throw new SlangTypeError("Operator =  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
        }
      case _ => throw new SlangTypeError("Operator =  does not take arguments of type: " + t1.pretty() + " and " + t2.pretty())
    }
  }
}