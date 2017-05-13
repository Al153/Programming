package Intermediate

import BackEnd.newLabel
import Exceptions.SlangTypeError
import Logging.PrettyPrinter
import Typing.{TSum, _}

/**
  * Created by Al on 13/03/2017.
  */
sealed trait AST {
  def pretty(indent: Int = 0): String
  def getType(gamma: Map[String, Type]): Type
  def getFreeVars(boundVars: List[String]): List[String] = {
    getFreeAux(boundVars, Nil)
  }
  def alpha(oldName: String, newName: String) : AST
  private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String]
  protected def getFreeLambda(bound: List[String], free: List[String], l:Lambda): List[String] = {
    l.getExpr.getFreeAux(l.getArg::bound, free)
  }
  protected def inlist[T](x: T, l: List[T]): Boolean = {
    l match {
      case Nil => false
      case h :: t => h.equals(x) || inlist[T](x, t)
    }
  }


}
  case class SUnit() extends  AST() {
    def pretty(indent: Int = 0): String ={
      PrettyPrinter.indentation(indent) + "Unit"
    }

    def getType(gamma: Map[String, Type]): Type = {
      val t = TSimple(new TUnit)
      t
    }

    override def alpha(oldName: String, newName: String): AST = this
    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = free
  }
  case class SVar(id : String) extends  AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "id(" + id + ")"
    }

    override def alpha(oldName: String, newName: String): AST = {
      if (oldName == id){
        SVar(newName)
      } else {
        this
      }
    }

    def getType(gamma: Map[String, Type]): Type = {
          println(gamma)
          val t = gamma(id)
          t
    }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      if (inlist (id, bound) || inlist (id, free)) {
        free
      } else {
        id :: free
      }
    }
  }
  case class SInt(value: Int) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "int(" + value + ")"
    }

    override def alpha(oldName: String, newName: String): AST = this

    def getType(gamma: Map[String, Type]): Type = {
      val t = TSimple(new TInt)
      t
    }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = free
  }

  case class SBoolean(value: Boolean) extends  AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "boolean(" + value + ")"
    }

    override def alpha(oldName: String, newName: String): AST = this

    def getType(gamma: Map[String, Type]): Type = {
          val t = TSimple(new TBool)
          t
      }
    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = free
  }
  case class SUnaryOp(op: UnaryOperator, e: AST) extends  AST() {
    override def pretty(indent: Int = 0): String = {
      op.pretty(indent) + " {\n" + e.pretty(indent + 1)+
        "\n"+ PrettyPrinter.indentation(indent) + "}"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newExpr = e.alpha(oldName, newName)
      SUnaryOp(op, newExpr)
    }

    def getType(gamma: Map[String, Type]): Type = {
      val t1 = e.getType(gamma)
      val t = op.getType(t1)
      t
    }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = e.getFreeAux(bound, free)
  }
  case class SOp(op: Operator, e1: AST, e2: AST) extends  AST() {
    override def pretty(indent: Int = 0): String = {
      op.pretty(indent) +
        " {\n" + e1.pretty(indent + 1)+ ",\n" +
        e2.pretty(indent + 1) +
        "\n"+ PrettyPrinter.indentation(indent) + "}"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newExpr1 = e1.alpha(oldName, newName)
      val newExpr2 = e2.alpha(oldName, newName)
      SOp(op, newExpr1, newExpr2)
    }

    def getType(gamma: Map[String, Type]): Type = {
      val t1 = e1.getType(gamma)
      val t2 = e2.getType(gamma)
      val t = op.getType(t1, t2)

      t
    }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      e2.getFreeAux(bound, e1.getFreeAux(bound, free))
    }
  }
  case class SIf(cond: AST, eTrue: AST, eFalse: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "if (\n" +
        cond.pretty(indent + 1) +
        "\n" + PrettyPrinter.indentation(indent) + ") then {\n" +
        eTrue.pretty(indent + 1)+ "\n" +
        PrettyPrinter.indentation(indent) + " } else {\n" +
        eFalse.pretty(indent + 1) +
        "\n"+ PrettyPrinter.indentation(indent) + "}"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newCond = cond.alpha(oldName, newName)
      val newTrue = eTrue.alpha(oldName, newName)
      val newFalse = eFalse.alpha(oldName, newName)
      SIf(newCond, newTrue, newFalse)
    }

    def getType(gamma: Map[String, Type]): Type = {
      val tTrue = eTrue.getType(gamma)
      val tFalse = eFalse.getType(gamma)
      val tCond = cond.getType(gamma)
      if (tCond.unify(TSimple(new TBool))){
        if (tTrue.unify(tFalse)) {
          tTrue
        } else {
          throw new SlangTypeError(
            "Branches of if expr: \n" + pretty() + "\nmismatch types\n" +
              "They have types: " + tTrue.pretty() + " and " + tFalse.pretty()
          )
        }
      } else {
        throw new SlangTypeError(
          "The condition of an if expr should be of Boolean type.\n" +
            "Instead,\n" + cond.pretty() + "\nHas type: " + tCond.pretty()
        )
      }
    }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      cond.getFreeAux(bound, eTrue.getFreeAux(bound, eFalse.getFreeAux(bound, free)))
    }
  }
  case class SPair(e1: AST, e2: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "PAIR (\n" +
        e1.pretty(indent + 1) +
        ",\n" + e2.pretty(indent + 1)+ "\n" +
        PrettyPrinter.indentation(indent) + " )"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newExpr1 = e1.alpha(oldName, newName)
      val newExpr2 = e2.alpha(oldName, newName)
      SPair(newExpr1, newExpr2)
    }

    def getType(gamma: Map[String, Type]): Type = {
      val t1 = e1.getType(gamma)
      val t2 = e2.getType(gamma)
      val t = TProduct(t1, t2)
      t
    }
    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      e2.getFreeAux(bound, e1.getFreeAux(bound, free))
    }
  }
  case class SFst(e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "FST (\n" +
        e.pretty(indent + 1) + "\n" +
        PrettyPrinter.indentation(indent) + " )"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newExpr = e.alpha(oldName, newName)
      SFst(newExpr)
    }

    def getType(gamma: Map[String, Type]): Type = {
      val tPair = e.getType(gamma)
      val defaultPairType = TProduct(new TVariable, new TVariable)
      println("FST: tPair = " + tPair.pretty())
      if (tPair.unify(defaultPairType)){
        val TProduct(t1, _) = tPair.prune()
        t1
      } else {
        throw new SlangTypeError(
          "FST requires a PRODUCT type argument\n" +
            "Instead,\n" + e.pretty() + "\nHas type: " + tPair.pretty()
        )
      }
    }
    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      e.getFreeAux(bound, free)
    }
  }
  case class SSnd(e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "SND (\n" +
        e.pretty(indent + 1) + "\n" +
        PrettyPrinter.indentation(indent) + " )"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newExpr = e.alpha(oldName, newName)
      SSnd(newExpr)
    }

    def getType(gamma: Map[String, Type]): Type = {
      val defaultPairType = TProduct(new TVariable, new TVariable)
      val tPair = e.getType(gamma)
      println("SND: tPair = " + tPair.pretty())
      if (tPair.unify(defaultPairType)){
        println("SND: tPair unified = " + tPair.pretty())
        val TProduct(_, t2) = tPair.prune()
        t2
      } else {
        throw new SlangTypeError(
          "FST requires a PRODUCT type argument\n" +
                "Instead,\n" + e.pretty() + "\nHas type: " + tPair.pretty()
        )
      }
    }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      e.getFreeAux(bound, free)
    }
  }

  case class SInl(t: Type, e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "INL (" + t.pretty() + ")\n" +
        e.pretty(indent + 1) + "\n" +
        PrettyPrinter.indentation(indent) + ")"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newExpr = e.alpha(oldName, newName)
      SInl(t, newExpr)
    }

    def getType(gamma: Map[String, Type]): Type = {
          val tExpr = e.getType(gamma)
          val tSum = TSum(tExpr, t)
          tSum

    }
    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      e.getFreeAux(bound, free)
    }
  }
  case class SInr(t: Type, e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "INR (" + t.pretty() + ")\n" +
        e.pretty(indent + 1) + "\n" +
        PrettyPrinter.indentation(indent) + " )"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newExpr = e.alpha(oldName, newName)
      SInr(t, newExpr)
    }



    def getType(gamma: Map[String, Type]): Type = {
      val tExpr = e.getType(gamma)
      val tSum = TSum(t, tExpr)
      tSum
    }
    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      e.getFreeAux(bound, free)
    }
  }
  case class SCase(e: AST, l: Lambda, r: Lambda) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "CASE (\n" +
        e.pretty(indent + 1) +
        "\n" + PrettyPrinter.indentation(indent) + ") OF INL\n" +
        l.pretty(indent + 1)+ "\n" +
        PrettyPrinter.indentation(indent) + "| INR\n" +
        r.pretty(indent + 1) + "\n"
      PrettyPrinter.indentation(indent) + "END"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newExpr = e.alpha(oldName, newName)
      val newL = l.alpha(oldName, newName)
      val newR = r.alpha(oldName, newName)
      SCase(newExpr, newL, newR)
    }



    def getType(gamma: Map[String, Type]): Type = {
      val tCond = e.getType(gamma)
      val defaultCaseType = TSum(new TVariable, new TVariable)
      if (tCond.unify(defaultCaseType)){
        val TSum(tLeft, tRight) = tCond.prune()
        val tLambdaLeft = l.getType(gamma)
        val tLambdaRight = r.getType(gamma)
        (tLambdaLeft, tLambdaRight) match {
          case (TFn(tArgLeft, tResLeft), TFn(tArgRight, tResRight)) =>
            if (tArgLeft.unify(tLeft) && tArgRight.unify(tRight)){
              if (tResLeft.unify(tResRight)) {
                tResLeft
              } else {
                throw new SlangTypeError(
                  "Branches of a case statement should be of equal type.\n" +
                    l.getExpr.pretty() + " : " + tResLeft.pretty() + "\n" +
                    r.getExpr.pretty() + " : " + tResRight.pretty() + "\n"
                )
              }
            } else {
              throw new SlangTypeError(
                "Branch constructors of a case statement should match the types of the sum.\n" +
                  "Sum: " + e.pretty() + "\n:" + tCond.pretty() + "\nWhile branches have constructors : " +
                  l.getArgType.pretty() + "\n and : " + r.getArgType.pretty()
              )
            }

          case _ => throw new SlangTypeError(
            "Missing case.\n" + tLambdaLeft.pretty() + "\nand\n" + tLambdaRight.pretty()
          )
        }
      } else {
        throw new SlangTypeError(
          "The condition of a case expr should be of sum type.\n" +
            "Instead,\n" + e.pretty() + "\nHas type: " + tCond.pretty()
        )
      }
    }


    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      getFreeLambda(bound,getFreeLambda(bound,e.getFreeAux(bound, free),l),r)
    }
  }

  case class SWhile(cond: AST, loop: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "while (\n" +
        cond.pretty(indent + 1) +
        "\n" + PrettyPrinter.indentation(indent) + ") do {\n" +
        loop.pretty(indent + 1)+ "\n" +
        PrettyPrinter.indentation(indent) + " }"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newCond = cond.alpha(oldName, newName)
      val newLoop = loop.alpha(oldName, newName)
      SWhile(newCond, newLoop)
    }

    def getType(gamma: Map[String, Type]): Type = {
      val tCond = cond.getType(gamma)
      if (tCond.unify(TSimple(new TBool))) {
        val tLoop = loop.getType(gamma)
        if (tLoop.unify(TSimple(new TUnit))) {
          tLoop
        } else {
          throw new SlangTypeError(
            "Looped code of while expr: \n" + pretty() + "\nshould have type\n" + TSimple(new TUnit).pretty() +
              "Looped code actually has type: " + tLoop.pretty()
          )
        }
      } else {
        throw new SlangTypeError(
          "The condition of while loop should be of Boolean type.\n" +
            "Instead,\n" + cond.pretty() + "\nhas type: " + tCond.pretty())
      }
    }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      loop.getFreeAux(bound, cond.getFreeAux(bound, free))
    }
  }
  case class SSeq(es: List[AST]) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "{\n" +
        es.map((e: AST) => e.pretty(indent + 1)).mkString(",\n") +
        "\n" + PrettyPrinter.indentation(indent) + "}"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newExprs = es map (e => e.alpha(oldName, newName))
     SSeq(newExprs)
    }


    def getType(gamma: Map[String, Type]): Type = {
      val typeList = es.map((x: AST) => x.getType(gamma))
      verifyTypeList(typeList) match {
        case Some(t1) => t1
        case None =>
          throw  new SlangTypeError(
            "A sequence of statements should have types [UNIT, ..., UNIT, T].\n"+
              pretty() + "\nHas types: [" + typeList.map((x: Type) => x.pretty()).mkString(", ")+ "]"
          )
      }
    }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      es match {
        case Nil => free
        case (e::rest) => SSeq(rest).getFreeAux(bound, e.getFreeAux(bound, free))
      }
    }

    def verifyTypeList(l: List[Type]): Option[Type] = {
      l match {
        case t :: Nil => Some(t)
        case t :: ts => if (t.unify(TSimple(new TUnit))){
          verifyTypeList(ts)
        } else {
          None
        }
        case _ => throw new SlangTypeError("Missing case: '" + l.mkString(", ") + "'")
      }
    }
  }
  case class SRef(e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "REF (\n" +
        e.pretty(indent + 1) +
        "\n" + PrettyPrinter.indentation(indent) + ")"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newExpr = e.alpha(oldName, newName)
      SRef(newExpr)
    }


    def getType(gamma: Map[String, Type]): Type = {
          val te = e.getType(gamma)
          val t = TRef(te)
          t

    }
    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      e.getFreeAux(bound, free)
    }
  }
  case class SDeref(e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "DEREF (\n" +
        e.pretty(indent + 1) +
        "\n" + PrettyPrinter.indentation(indent) + ")"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newExpr = e.alpha(oldName, newName)
      SDeref(newExpr)
    }

    def getType(gamma: Map[String, Type]): Type = {
      val te = e.getType(gamma)
      val refType = new TVariable
      if (te.unify(TRef(refType))) {
        refType
      } else {
        throw new SlangTypeError(
          "The expression of a dereference should be of REF(T) type.\n" +
            "Instead,\n" + e.pretty() + "\nhas type: " + te.pretty()
        )
      }
    }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      e.getFreeAux(bound, free)
    }
  }
  case class SAssign(dest: AST, source: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "ASSIGN (\n" +
        dest.pretty(indent + 1) +
        "\n" + PrettyPrinter.indentation(indent) + ") = {\n" +
        source.pretty(indent + 1)+ "\n" +
        PrettyPrinter.indentation(indent) + "}"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newSource = source.alpha(oldName, newName)
      val newDest = dest.alpha(oldName, newName)
      SAssign(newSource, newDest)
    }

    def getType(gamma: Map[String, Type]): Type = {
      val tDest = dest.getType(gamma)
      val tSource = source.getType(gamma)
      if (tDest.unify(TRef(tSource))) {
        val t = TSimple(new TUnit)
        t
      } else {
        throw new SlangTypeError(
          "Assignment expr " + pretty() + "\nshould have types ref(T) := T\n" +
            "Instead, they have types\n" + tDest.pretty() + " and " + tSource.pretty()
        )
      }
    }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      dest.getFreeAux(bound, source.getFreeAux(bound, free))
    }
  }

  case class SLambda(l : Lambda) extends AST() {
    override def pretty(indent: Int = 0): String = {
      l.pretty(indent)
    }

    override def alpha(oldName: String, newName: String): AST = {
      SLambda(l.alpha(oldName, newName))
    }


    def getType(gamma: Map[String, Type]): Type = {
         val t = l.getType(gamma)
          t
      }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      getFreeLambda(bound, free, l)
    }
  }

  case class SApp(e1: AST, e2: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "APPLY (\n" +
        e1.pretty(indent + 1) +
        "\n" + PrettyPrinter.indentation(indent) + ") (\n" +
        e2.pretty(indent + 1)+ "\n" +
        PrettyPrinter.indentation(indent) + " )"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newExpr1 = e1.alpha(oldName, newName)
      val newExpr2 = e2.alpha(oldName, newName)
      SApp(newExpr1, newExpr2)
    }


    def getType(gamma: Map[String, Type]): Type = {
      val tFn = e1.getType(gamma)
      val argType = e2.getType(gamma)
      val resultType = TVariable()
      if (TFn(argType, resultType).unify(tFn)){
          resultType
      } else {
        throw new SlangTypeError(
          "Expressions in application " + pretty() + "\n should have types A -> B and A.\n" +
            "Instead, they have types" + tFn.pretty() + " and " + argType.pretty()
        )
      }
    }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      e2.getFreeAux(bound, e1.getFreeAux(bound, free))
    }
  }

  case class SLetFun(id: String, l: Lambda, t: Option[Type], e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      val typeString = t match {
        case None => ""
        case Some(t1) => " : " + t1.pretty()
      }

      PrettyPrinter.indentation(indent) + "let " + id + "(\n" +
          l.pretty(indent + 1) +
        "\n" + PrettyPrinter.indentation(indent) + ")" + typeString+ " in {\n" +
          e.pretty(indent + 1)+ "\n" +
        PrettyPrinter.indentation(indent) + "}"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val newLam = l.alpha(oldName, newName)
      val (newId, newExpr) =
        if (id == oldName){
          (id,e) // due to alpha scoping, if id == oldname, then all instances of oldName in e are actually instances of id
        } else  {
          val (checkedId, checkedExpr) =
            if ( id == newName) { // otherwise, if the alpha conversion produces a name clash, rename the existing name first
              val newId = newLabel.apply
              (newId, e.alpha(id, newId))
            } else {
              (id, e)
            }
          (checkedId, checkedExpr.alpha(oldName, newName))
        }
      SLetFun(newId, newLam, t, newExpr)
    }

    def getType(gamma: Map[String, Type]): Type = {
      val defnType = l.getType(gamma)
      val newGamma = gamma + (id->defnType)
      val resultType = e.getType(newGamma)
      t match {
        case None => resultType
        case Some(t1) =>
          if (t1.unify(resultType)) {
            t1
          } else {
            throw new SlangTypeError(
              "Type annotation of " + pretty() +
                "\nGives " + id + " with return type " + t1.pretty() + ".\n" +
                "Instead,\n" + id + "\nhas type type: " + resultType.pretty()
            )
          }
      }
    }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      e.getFreeAux(id::bound, getFreeLambda(bound, free, l))
    }
  }
  case class SLetRecFun(id: String, l: Lambda, t: Option[Type], e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      val typeString = t match {
        case None => ""
        case Some(t1) => " : " + t1.pretty()
      }
      PrettyPrinter.indentation(indent) + "let rec " + id + "(\n" +
        l.pretty(indent + 1) +
        "\n" + PrettyPrinter.indentation(indent) + ")" + typeString + " in {\n" +
      e.pretty(indent + 1)+ "\n" +
        PrettyPrinter.indentation(indent) + "}"
    }

    override def alpha(oldName: String, newName: String): AST = {
      val (newId, newExpr, newLam) =
        if (oldName == id) {
          (id, e, l) // if oldname == id, then all instances of oldName are instances of id
        } else {
          val (checkedId, checkedExpr, checkedLam) =
            if (newName == id) { // if id == new name, then need to rename id to avoid a name clash
             val newId = newLabel.apply
              (newId, e.alpha(id, newId), l.alpha(id, newId))
            } else {
              (id, e, l)
           }
          (checkedId, checkedExpr.alpha(oldName, newName), checkedLam.alpha(oldName, newName))
        }
      SLetRecFun(newId, newLam, t, newExpr)
    }


    def getType(gamma: Map[String, Type]): Type = {
      val newType = new TVariable
      val newGamma = gamma + (id -> newType)
      val defnType = l.getType(newGamma) //, nongen + newtype)
      println("definition type = " + defnType.pretty())
      newType.unify(defnType)
      val TFn(_, returnType) = newType.prune()
      val res = e.getType(newGamma)
      println("definition type = " + defnType.pretty())
      println("result type = " + res.pretty())
      t match {
        case None => res
        case Some(t1) =>
          if (t1.unify(returnType))  {
            res
          } else {
            throw new SlangTypeError(
              "Type annotation of " + pretty() +
                "\nGives " + id + " with return type " + t1.pretty() + ".\n" +
                "Instead,\n" + id + "\nhas type type: " + returnType.pretty()
            )
          }
        }
    }

    override private[Intermediate] def getFreeAux(bound: List[String], free: List[String]): List[String] = {
      e.getFreeAux(id::bound, getFreeLambda(id::bound, free, l))
    }
  }

//case class SDefType(types: List[AlgebraicType], expr: AST) extends AST {
  // TODO nodes of this class represent the result of
    // datatype 'a x = ...
  // It defines the types of constructors
  // Compiling this node should also create a closure for constructor
  // Typechecking it should define the function types of constructors

// }
