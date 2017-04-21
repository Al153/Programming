package Parsing.SyntaxTree

import Logging.PrettyPrinter

/**
  * Created by Al on 13/03/2017.
  */
sealed trait Type {
  def pretty(): String
  def equalTo(t: Type): Boolean
}
case class TSimple(s: SimpleType) extends Type {
  override def pretty(): String = {
    s.pretty()
  }

  override def equalTo(t: Type): Boolean = {
    t match {
      case TSimple(ts) => s.equalTo(ts)
      case _ => false
    }
  }
}
case class TSum(t1: Type, t2: Type) extends Type {
  override def pretty(): String = {
    "(" + t1.pretty() + ") + (" + t2.pretty + ")"
  }

  override def equalTo(t: Type): Boolean = {
    t match {
      case TSum(u1, u2) => t1.equalTo(u1) && t2.equalTo(u2)
      case _ => false
    }
  }
}
case class TProduct(t1: Type, t2: Type) extends Type {
  override def pretty(): String = {
    "(" + t1.pretty() + ") * (" + t2.pretty + ")"
  }

  override def equalTo(t: Type): Boolean = {
    t match {
      case TProduct(u1, u2) => t1.equalTo(u1) && t2.equalTo(u2)
      case _ => false
    }
  }
}
case class TRef(t1: Type) extends Type {
  override def pretty(): String = {
    "(" + t1.pretty() + ") REF"
  }

  override def equalTo(t: Type): Boolean = {
    t match {
      case TRef(u) => t1.equalTo(u)
      case _ => false
    }
  }
}
case class TFn(t1: Type, t2: Type) extends  Type {
  override def pretty(): String = {
    "(" + t1.pretty() + ") => (" + t2.pretty + ")"
  }

  override def equalTo(t: Type): Boolean = {
    t match {
      case TFn(u1, u2) => t1.equalTo(u1) && t2.equalTo(u2)
      case _ => false
    }
  }
}

sealed trait SimpleType {
  def pretty(): String
  def equalTo(simpleType: SimpleType): Boolean
}
case class TInt() extends SimpleType {
  override def pretty(): String = {
    "INT"
  }

  override def equalTo(s: SimpleType) = {
    s match {
      case TInt() => true
      case _ => false
    }
  }
}
case class TBool() extends SimpleType {
  override def pretty(): String = {
    "BOOL"
  }
  override def equalTo(s: SimpleType) = {
    s match {
      case TBool() => true
      case _ => false
    }
  }
}
case class TUnit() extends SimpleType {
  override def pretty(): String = {
    "UNIT"
  }

  override def equalTo(s: SimpleType) = {
    s match {
      case TUnit() => true
      case _ => false
    }
  }
}
// case class TId(id: String) extends SimpleType