package Typing

/**
  * Created by Al on 24/04/2017.
  */
sealed trait SimpleType {
  def pretty(): String
  def equalTo(simpleType: SimpleType): Boolean
}

case class TBool() extends SimpleType {
  override def pretty(): String = {
    "BOOL"
  }
  override def equalTo(s: SimpleType): Boolean = {
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

  override def equalTo(s: SimpleType): Boolean = {
    s match {
      case TUnit() => true
      case _ => false
    }
  }
}

case class TInt() extends SimpleType {
  override def pretty(): String = {
    "INT"
  }

  override def equalTo(s: SimpleType): Boolean = {
    s match {
      case TInt() => true
      case _ => false
    }
  }
}

case class TId(id: String) extends SimpleType{
  // Represents user defined types
  // We do nominal type comparison
  override def pretty(): String = id

  override def equalTo(s: SimpleType): Boolean = {
    s match {
      case TId(id2) => id2 == id
      case _ => false
    }
  }
}