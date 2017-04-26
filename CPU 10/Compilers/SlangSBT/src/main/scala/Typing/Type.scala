package Typing

import Exceptions.OccursCheckException

/**
  * Created by Al on 13/03/2017.
  */
sealed trait Type {
  def pretty(): String // a string of the type suitable for printing
  def unify(t: Type): Boolean = { // check types can unifyAux
    val ct = t.prune()
    val cThis = this.prune()
    ct match {
      case TVariable() => ct.unifyAux(cThis) // if t is a top level variable, then want to unify it
      case _ => cThis.unifyAux(ct) // otherwise this is either a top level type variable or a defined type, so use this to unify
    }
  }
  def occurs(id: Int): Boolean // occurs check
  def unifyAux(t: Type): Boolean // Unifies two types where either both are not variables or this is a variable
  def prune(): Type // consolidates a type by removing chains of unified variables
}
case class TSimple(s: SimpleType) extends Type {
  override def pretty(): String = {
    s.pretty()
  }

  override def unifyAux(t: Type): Boolean = {
    t match {
      case TSimple(ts) => s.equalTo(ts)
      case _ => false
    }
  }

  override def occurs(id: Int) = false // does not include a parametric type
  override def prune(): TSimple = this
}

case class TVariable() extends Type { // Variable type for use in the Creole language's milner Hindley Type system
  val id: Int = newTypeParameter.apply
  var typeValue: Option[Type] = None

  override def pretty(): String = {
    typeValue match {
      case None => "A"+id.toString
      case Some(t) => t.pretty()
    }

  }

  override def unifyAux(t: Type): Boolean = {
    // need to do occurs check
    typeValue match {
      case Some(t1) => t.unify(t1)
      case None =>
       (t == this) ||  { if (!t.occurs(id)){ // if t and this are the same, then that is an allowable occcurs exception
          typeValue = Some(t)
          true
        } else {
          throw new OccursCheckException(id)
        }
       }
    }
  }

  override def occurs(otherId: Int): Boolean = {
    typeValue match {
      case None => otherId == this.id
      case Some(t) => t.occurs(otherId)
    }
  }

  override def prune(): Type = typeValue match {
    case None => this
    case Some(referencedType) => referencedType.prune()
  }
}

case class TSum(t1: Type, t2: Type) extends Type {
  override def pretty(): String = {
    "(" + t1.pretty() + ") + (" + t2.pretty + ")"
  }

  override def unifyAux(t: Type): Boolean = {
    t match {
      case TSum(u1, u2) => t1.unify(u1) && t2.unify(u2)
      case _ => false
    }
  }

  override def occurs(id: Int): Boolean = {
    t1.occurs(id) || t2.occurs(id)
  }

  override def prune(): TSum = {
    TSum(t1.prune(), t2.prune())
  }
}
case class TProduct(t1: Type, t2: Type) extends Type {
  override def pretty(): String = {
    "(" + t1.pretty() + ") * (" + t2.pretty + ")"
  }

  override def unifyAux(t: Type): Boolean = {
    t match {
      case TProduct(u1, u2) => t1.unify(u1) && t2.unify(u2)
      case _ => false
    }
  }
  override def occurs(id: Int): Boolean = {
    t1.occurs(id) || t2.occurs(id)
  }

  override def prune(): TProduct = {
    TProduct(t1.prune(), t2.prune())
  }
}
case class TRef(t1: Type) extends Type {
  override def pretty(): String = {
    "(" + t1.pretty() + ") REF"
  }

  override def unifyAux(t: Type): Boolean = {
    t match {
      case TRef(u) => t1.unify(u)
      case _ => false
    }
  }
  override def occurs(id: Int): Boolean = {
    t1.occurs(id)
  }

  override def prune(): TRef = {
    TRef(t1.prune())
  }
}


case class TFn(t1: Type, t2: Type) extends  Type {
  val tArg: Type = t1
  val tRes: Type = t2

  override def pretty(): String = {
    "(" + t1.pretty() + ") => (" + t2.pretty + ")"
  }

  override def unifyAux(t: Type): Boolean = {
    t match {
      case TFn(u1, u2) => t1.unify(u1) && t2.unify(u2)
      case _ => false
    }
  }

  override def occurs(id: Int): Boolean = {
    t1.occurs(id) || t2.occurs(id)
  }

  override def prune(): TFn = {
   TFn(t1.prune(), t2.prune())
  }
}
