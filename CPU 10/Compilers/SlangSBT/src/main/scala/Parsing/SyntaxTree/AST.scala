package Parsing.SyntaxTree

import Logging.PrettyPrinter
import Exceptions.SlangTypeError

/**
  * Created by Al on 13/03/2017.
  */
sealed trait AST {
  def pretty(indent: Int = 0): String
  def getType(gamma: Map[String, Type]): Type
}
  case class SUnit() extends   AST() {
    def pretty(indent: Int = 0): String ={
      PrettyPrinter.indentation(indent) + "Unit"
    }

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val t = TSimple(new TUnit)
          T = Some(t)
          t
      }
    }
  }
  case class SVar(id : String) extends  AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "id(" + id + ")"
    }
    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val t = gamma(id)
          T = Some(t)
          t
      }
    }
  }
  case class SInt(value: Int) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "int(" + value + ")"
    }
    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val t = TSimple(new TInt)
          T = Some(t)
          t
      }
    }
  }

  case class SBoolean(value: Boolean) extends  AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "boolean(" + value + ")"
    }

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val t = TSimple(new TBool)
          T = Some(t)
          t
      }
    }
  }
  case class SUnaryOp(op: UnaryOperator, e: AST) extends  AST() {
    override def pretty(indent: Int = 0): String = {
      op.pretty(indent) + " {\n" + e.pretty(indent + 1)+
        "\n"+ PrettyPrinter.indentation(indent) + "}"
    }

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val t1 = e.getType(gamma)
          val t = op.getType(t1)
          T = Some(t)
          t
      }
    }
  }
  case class SOp(op: Operator, e1: AST, e2: AST) extends  AST() {
    override def pretty(indent: Int = 0): String = {
      op.pretty(indent) +
        " {\n" + e1.pretty(indent + 1)+ ",\n" +
        e2.pretty(indent + 1) +
        "\n"+ PrettyPrinter.indentation(indent) + "}"
    }

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val t1 = e1.getType(gamma)
          val t2 = e2.getType(gamma)
          val t = op.getType(t1, t2)
          T = Some(t)
          t
      }
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

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val tCond = cond.getType(gamma)
          tCond match  {
            case TSimple(TBool()) =>
              val tTrue = eTrue.getType(gamma)
              val tFalse = eFalse.getType(gamma)
              if (tTrue.equalTo(tFalse)) {
                T = Some(tTrue)
                tTrue
              } else {
                throw new SlangTypeError(
                  "Branches of if expr: \n" + pretty() + "\nmismatch types\n" +
                    "They have types: " + tTrue.pretty() + " and " + tFalse.pretty()
                )
              }
            case _ => throw new SlangTypeError(
              "The condition of an if expr should be of Boolean type.\n" +
                "Instead,\n" + cond.pretty() + "\nHas type: " + tCond.pretty()
            )
          }

      }
    }
  }
  case class SPair(e1: AST, e2: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "PAIR (\n" +
        e1.pretty(indent + 1) +
        ",\n" + e2.pretty(indent + 1)+ "\n" +
        PrettyPrinter.indentation(indent) + " )"
    }
    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val t1 = e1.getType(gamma)
          val t2 = e2.getType(gamma)
          val t = TProduct(t1, t2)
          T = Some(t)
          t
      }
    }
  }
  case class SFst(e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "FST (\n" +
        e.pretty(indent + 1) + "\n" +
        PrettyPrinter.indentation(indent) + " )"
    }

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val tPair = e.getType(gamma)
          tPair match  {
            case TProduct(t1, t2) =>
                T = Some(t1)
                t1
            case _ => throw new SlangTypeError(
              "FST requires a PRODUCT type argument\n" +
                "Instead,\n" + e.pretty() + "\nHas type: " + tPair.pretty()
            )
          }

      }
    }
  }
  case class SSnd(e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "SND (\n" +
        e.pretty(indent + 1) + "\n" +
        PrettyPrinter.indentation(indent) + " )"
    }
    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val tPair = e.getType(gamma)
          tPair match  {
            case TProduct(t1, t2) =>
              T = Some(t2)
              t2
            case _ => throw new SlangTypeError(
              "FST requires a PRODUCT type argument\n" +
                "Instead,\n" + e.pretty() + "\nHas type: " + tPair.pretty()
            )
          }

      }
    }
  }

  case class SInl(t: Type, e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "INL (" + t.pretty() + ")\n" +
        e.pretty(indent + 1) + "\n" +
        PrettyPrinter.indentation(indent) + ")"
    }

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t1) => t1
        case None =>
          val tExpr = e.getType(gamma)
          val tSum = TSum(tExpr, t)
          T = Some(tSum)
          tSum
      }
    }
  }
  case class SInr(t: Type, e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "INR (" + t.pretty() + ")\n" +
        e.pretty(indent + 1) + "\n" +
        PrettyPrinter.indentation(indent) + " )"
    }

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t1) => t1
        case None =>
          val tExpr = e.getType(gamma)
          val tSum = TSum(t, tExpr)
          T = Some(tSum)
          tSum
      }
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

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val tCond = e.getType(gamma)
          tCond match  {
            case TSum(tLeft, tRight) =>
              val tLambdaLeft = l.getType(gamma)
              val tLambdaRight = r.getType(gamma)
              (tLambdaLeft, tLambdaRight) match {
                case (TFn(tArgLeft, tResLeft), TFn(tArgRight, tResRight)) =>
                  if (tArgLeft.equalTo(tLeft) && tArgRight.equalTo(tRight)){
                    if (tResLeft.equalTo(tResRight)) {
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
            case _ => throw new SlangTypeError(
              "The condition of a case expr should be of sum type.\n" +
                "Instead,\n" + e.pretty() + "\nHas type: " + tCond.pretty()
            )
          }
      }
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

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val tCond = cond.getType(gamma)
          tCond match  {
            case TSimple(TBool()) =>
              val tLoop = loop.getType(gamma)
              if (tLoop.equalTo(TSimple( new TUnit))) {
                T = Some(tLoop)
                tLoop
              } else {
                throw new SlangTypeError(
                  "Looped code of while expr: \n" + pretty() + "\nshould have type\n" + TSimple( new TUnit).pretty() +
                    "Looped code actually has type: " + tLoop.pretty()
                )
              }
            case _ => throw new SlangTypeError(
              "The condition of while loop should be of Boolean type.\n" +
                "Instead,\n" + cond.pretty() + "\nhas type: " + tCond.pretty()
            )
          }

      }
    }
  }
  case class SSeq(es: List[AST]) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "{\n" +
        es.map((e: AST) => e.pretty(indent + 1)).mkString(",\n") +
        "\n" + PrettyPrinter.indentation(indent) + "}"
    }

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t1) => t1
        case None =>
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
    }
    def verifyTypeList(l: List[Type]): Option[Type] = {
      l match {
        case t :: Nil => Some(t)
        case t :: ts => if (t.equalTo(TSimple(new TUnit))){
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

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val te = e.getType(gamma)
          val t = TRef(te)
          T = Some(t)
          t
      }
    }
  }
  case class SDeref(e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "DEREF (\n" +
        e.pretty(indent + 1) +
        "\n" + PrettyPrinter.indentation(indent) + ")"
    }

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val te = e.getType(gamma)
          te match  {
            case TRef(t) =>
                T = Some(t)
                t
            case _ => throw new SlangTypeError(
              "The expression of a dereference should be of REF(T) type.\n" +
                "Instead,\n" + e.pretty() + "\nhas type: " + te.pretty()
            )
          }
      }
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

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val tDest = dest.getType(gamma)
          val tSource = source.getType(gamma)
          tDest match  {
            case TRef(tDestRef) =>
              if (tDestRef.equalTo(tSource)){
                val t = TSimple(new TUnit)
                T = Some(t)
                t
              } else {
                throw new SlangTypeError(
                  "Assignment expr " + pretty() + "\nshould have types ref(T) := T\n" +
                    "Instead, they have types\n" + tDest.pretty() + " and " + tSource.pretty()
                )
              }
            case _ =>
              throw new SlangTypeError(
                  "Assignment expr " + pretty() + "\nshould have types ref(T) := T\n" +
                    "Instead, they have types\n" + tDest.pretty() + " and " + tSource.pretty()
              )
          }
      }
    }
  }

  case class SLambda(l : Lambda) extends AST() {
    override def pretty(indent: Int = 0): String = {
      l.pretty(indent)
    }

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
         val t = l.getType(gamma)
          T = Some(t)
          t
      }
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

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t) => t
        case None =>
          val tFn = e1.getType(gamma)
          val t2 = e2.getType(gamma)
          tFn match  {
            case TFn(tArg, tResult) =>
              if (tArg.equalTo(t2)) {
                T = Some(tResult)
                tResult
              } else {
                throw new SlangTypeError(
                  "Expressions in application " + pretty() + "\n should have types A -> B and A.\n" +
                    "Instead, they have types" + tFn.pretty() + " and " + t2.pretty()
                )
              }
            case _ => throw new SlangTypeError(
              "Expressions in application " + pretty() + "\n should have types A -> B and A.\n" +
                "Instead, they have types" + tFn.pretty() + " and " + t2.pretty()
            )
          }
      }
    }
  }

  case class SLetFun(id: String, l: Lambda, t: Type, e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "let " + id + "(\n" +
          l.pretty(indent + 1) +
        "\n" + PrettyPrinter.indentation(indent) + ") : " + t.pretty() + " in {\n" +
          e.pretty(indent + 1)+ "\n" +
        PrettyPrinter.indentation(indent) + "}"
    }

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t1) => t1
        case None =>
          val lambdaType = l.getType(gamma)
          lambdaType match  {
            case TFn(tArg, tRes) =>
              if (tRes.equalTo(t)){
                val substitution = e.getType(gamma + (id -> lambdaType))
                T = Some(substitution)
                substitution
              } else {
                throw new SlangTypeError(
                  "Type annotation of " + pretty() +
                    "\nGives " + id + " with return type " + t.pretty() + ".\n" +
                    "Instead,\n" + id + "\nhas type type: " + lambdaType.pretty()
                )
              }
            case _ => throw new SlangTypeError(
              "Type annotation of " + pretty() +
                "\nGives " + id + " with return type " + t.pretty() + ".\n" +
                "Instead,\n" + id + "\nhas type type: " + lambdaType.pretty()
            )
          }

      }
    }
  }
  case class SLetRecFun(id: String, l: Lambda, t: Type, e: AST) extends AST() {
    override def pretty(indent: Int = 0): String = {
      PrettyPrinter.indentation(indent) + "let rec " + id + "(\n" +
        l.pretty(indent + 1) +
        "\n" + PrettyPrinter.indentation(indent) + ") : " + t.pretty() + " in {\n" +
      e.pretty(indent + 1)+ "\n" +
        PrettyPrinter.indentation(indent) + "}"
    }

    private var T: Option[Type] = None
    def getType(gamma: Map[String, Type]): Type = {
      T match {
        case Some(t1) => t1
        case None =>
          val lambdaType = l.getType(gamma + (id -> TFn(l.getArgType, t)))
          lambdaType match  {
            case TFn(tArg, tRes) =>
              if (tRes.equalTo(t)){
                val substitution = e.getType(gamma + (id -> lambdaType))
                T = Some(substitution)
                substitution
              } else {
                throw new SlangTypeError(
                  "Type annotation of " + pretty() +
                    "\nGives " + id + " with return type " + t.pretty() + ".\n" +
                    "Instead,\n" + id + "\nhas type type: " + lambdaType.pretty()
                )
              }
            case _ => throw new SlangTypeError(
              "Type annotation of " + pretty() +
                "\nGives " + id + " with return type " + t.pretty() + ".\n" +
                "Instead,\n" + id + "\nhas type type: " + lambdaType.pretty()
            )
          }

      }
    }
  }
