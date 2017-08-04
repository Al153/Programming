package Intermediate

import BackEnd.newLabel
import Logging.PrettyPrinter
import Typing.{TFn, Type, newTypeParameter}

class Lambda(bound: String, e: AST, t: Option[Type]) {
  // Lambdas have bound types (type of bound var is not cloned)
  def getExpr : AST = e
  def getArg: String = bound
  protected val argType: Type = newTypeParameter.newVar()


  def getArgType: Type = {
      argType
  }

  def pretty(indent: Int = 0): String = {
    val i = PrettyPrinter.indentation(indent)
    val typeString = t match {
      case None => ""
      case Some(t1) => " : " + t1.pretty()
    }
    i + "B_LAMBDA " + bound + typeString + " {\n" + e.pretty(indent + 1) + "\n" + i + "}"
  }

  def getType(gamma: Map[String, Type], noClone: Set[String]): Type = {
    val newNoClone = noClone + bound
    val resultType = e.getType(gamma + (bound -> argType), newNoClone) // //, nongen + argType)
    TFn(argType, resultType)
  }

  def alpha(oldName: String, newName: String): Lambda = {
    if (oldName == bound) { // if bound variable has the same name as the one to change,
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