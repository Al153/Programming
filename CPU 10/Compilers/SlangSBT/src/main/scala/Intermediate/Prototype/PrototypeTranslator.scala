package Intermediate.Prototype

import Exceptions.{MissingCSTCaseException, MissingCSTTypeCaseException}
import Intermediate._
import Parsing.SyntaxTree.{ConcreteSyntaxTree, NonTerminal, Terminal}
import Typing._

import scala.collection.immutable.::

/**
  * Created by Al on 12/05/2017.
  */
class PrototypeTranslator extends CSTTranslator {
  def apply(c: ConcreteSyntaxTree): AST = {
    SBoolean(true)
    // convert(c)
  }

  def convert(c: ConcreteSyntaxTree): AST = {
    c match {
      case NonTerminal(nodeType, children) =>
        nodeType match {
          case "GOAL" => convert(children.head)
          case "PROGRAM" => convert(children.head)
          case "expr" => children match {
            case List(e1: NonTerminal, op: NonTerminal, e2: NonTerminal) =>
              convertOp(op, convert(e1), convert(e2))
            case List(Terminal("\"begin\"", _), seq: NonTerminal, Terminal("\"end\"", _)) =>
              convert(seq)
            case head :: Nil => convert(head)
            case _ => throw MissingCSTCaseException("expr", children)
          }
          case "term" => children match {
            case List(e1: NonTerminal, op: NonTerminal, e2: NonTerminal) =>
              convertOp(op, convert(e1), convert(e2))
            case expr :: Nil => convert(expr)
            case _ => throw MissingCSTCaseException("term", children)
          }
          case "factor" => children match {
            case nt::Nil => convert(nt)
            case _ => throw MissingCSTCaseException("factor", children)
          }
          case "composition" => children match {
            case expr :: value :: Nil => SApp(convert(expr), convert(value))
            case value :: Nil => convert(value)
            case _ => throw MissingCSTCaseException("composition", children)
          }
          case "value" => children match {
            case NonTerminal("const", _) :: Nil =>
              convertConst(children.head)
            case Terminal("id", name) :: Nil => SVar(name)
            case Terminal("\"(\"", _) :: expr :: Terminal("\")\"", _) :: Nil => convert(expr)
            case Terminal("\"(\"", _) :: e1 :: Terminal("\",\"", _) :: e2 :: Terminal("\")\"", _) :: Nil =>
              SPair(convert(e1), convert(e2))
            case uop :: value :: Nil =>
              convertUOp(uop, convert(value))
            case _ => throw MissingCSTCaseException("value", children)
          }
          case "seq" => SSeq(convertSequence(c))
          case "ternary_expr" => children match {
            case Terminal("\"if\"", _) :: cond ::
              Terminal("\"then\"", _) :: eTrue ::
              Terminal("\"else\"", _) :: eFalse ::
              Terminal("\"end\"", _) :: Nil => SIf(convert(cond), convert(eTrue), convert(eFalse))
            case _ => throw MissingCSTCaseException("ternary_expr", children)
          }
          case "while_loop" => children match {
            case Terminal("\"while\"", _) :: cond ::
              Terminal("\"do\"", _) :: expr ::
              Terminal("\"end\"", _) :: Nil => SWhile(convert(cond), convert(expr))
            case _ => throw MissingCSTCaseException("while_loop", children)
          }
          case "lambda" => children match {
            case Terminal("\"fun\"", _) :: Terminal("\"(\"", _) ::
              Terminal("id", variable) ::
              tOpt :: Terminal("\")\"", _) ::
              NonTerminal("arrow", _) :: expr ::
              Terminal("\"end\"", _) :: Nil =>
              SLambda(new Lambda(variable, convert(expr), convertTypeOption(tOpt)))
            case _ => throw MissingCSTCaseException("lambda", children)
          }
          case "let" => children match {
            case Terminal("\"let\"", _) ::
              Terminal("id", variable) ::
              tOpt :: Terminal("\"=\"", _) ::
              binding :: Terminal("\"in\"", _) ::
              expr :: Terminal("\"end\"", _) :: Nil =>
              SLetVal(variable, convertTypeOption(tOpt), convert(binding), convert(expr))
            case _ => throw MissingCSTCaseException("let", children)
          }
          case "let_fn" => children match {
            case Terminal("\"let\"", _) ::
              Terminal("id", fName) :: Terminal("\"(\"", _) ::
              Terminal("id", argName) ::
              argType :: Terminal("\")\"", _) ::
              fType :: Terminal("\"=\"", _) ::
              fExpr :: Terminal("\"in\"", _) ::
              expr :: Terminal("\"end\"", _) :: Nil =>
              SLetFun(
                fName,
                new Lambda(argName, convert(fExpr), convertTypeOption(argType)),
                convertTypeOption(fType), convert(expr)
              )
            case _ => throw MissingCSTCaseException("let_fn", children)
          }

          case "let_rec_fn" => children match {
            case Terminal("\"let\"", _) :: Terminal("\"rec\"", _) ::
              Terminal("id", fName) :: Terminal("\"(\"", _) ::
              Terminal("id", argName) ::
              argType :: Terminal("\")\"", _) ::
              fType :: Terminal("\"=\"", _) ::
              fExpr :: Terminal("\"in\"", _) ::
              expr :: Terminal("\"end\"", _) :: Nil =>
              SLetRecFun(
                fName,
                new Lambda(argName, convert(fExpr),  convertTypeOption(argType)),
                convertTypeOption(fType), convert(expr)
              )
            case _ => throw MissingCSTCaseException("let_rec_fn", children)
          }

          case "assignment" => children match {
            case lhs :: NonTerminal("assop", _) ::
              expr :: Nil =>
              SAssign(convert(lhs), convert(expr))
            case _ => throw MissingCSTCaseException("assignment", children)
          }

          case "case_expr" => children match{
            case Terminal("\"case\"", _) :: expr ::
              Terminal("\"of\"",_) :: Terminal("\"inl\"", _) ::
              Terminal("\"(\"", _) :: Terminal("id", leftVar) ::
              leftType :: Terminal("\")\"", _) ::
              NonTerminal("arrow", _) :: leftExpr ::
              Terminal("\"|\"",_) :: Terminal("\"inr\"", _) ::
              Terminal("\"(\"", _) :: Terminal("id", rightVar) ::
              rightType :: Terminal("\")\"", _) ::
              NonTerminal("arrow", _) :: rightExpr ::
              Terminal("\"end\"", _) :: Nil =>
              SCase(
                convert(expr),
                new Lambda(leftVar, convert(leftExpr),convertTypeOption(leftType)),
                new Lambda(rightVar, convert(rightExpr), convertTypeOption(rightType))
              )
            case _ => throw MissingCSTCaseException("let_rec_fn", children)
          }
          case _ => throw MissingCSTCaseException(nodeType, children)
        }
      case Terminal(nodeType, _) => throw  MissingCSTCaseException(nodeType, Nil)
    }
  }

  def convertOp(op: ConcreteSyntaxTree, e1: AST, e2: AST) : AST ={
    op match {
      case NonTerminal(opClass, children) => children match {
        case Terminal("\"*\"", _) :: Nil => SOp(new MUL, e1, e2)
        case Terminal("\"+\"", _) :: Nil => SOp(new ADD, e1, e2)
        case Terminal("\"-\"", _) :: Nil => SOp(new SUB, e1, e2)
        case Terminal("\"<\"", _) :: Nil => SOp(new LT, e1, e2)
        case Terminal("\"=\"", _) :: Nil => SOp(new EQ, e1, e2)
        case NonTerminal("and", _) :: Nil => SOp(new AND, e1, e2)
        case NonTerminal("or", _) :: Nil => SOp(new OR, e1, e2)
        case _ => throw MissingCSTCaseException(opClass, children)
      }
      case Terminal(opClass, _) => throw  MissingCSTCaseException(opClass, Nil)
    }
  }

  def convertType(t: ConcreteSyntaxTree) : Type ={
    t match {
      case NonTerminal(nodeType, children) =>
        nodeType match {
          case "t_expr" => children match {
            case t1 :: NonTerminal("arrow", _) :: t2 :: Nil => TFn(convertType(t1), convertType(t2))
            case NonTerminal("t_sum", _) :: Nil => convertType(children.head)
            case _ =>  throw MissingCSTTypeCaseException(nodeType, children)
          }
          case "t_sum" => children match {
            case t1 :: Terminal("\"+\"", _) :: t2 :: Nil => TSum(convertType(t1), convertType(t2))
            case NonTerminal("t_term", _) :: Nil => convertType(children.head)
            case _ =>  throw MissingCSTTypeCaseException(nodeType, children)
          }
          case "t_term" => children match {
            case t1 :: Terminal("\"*\"", _) :: t2 :: Nil => TProduct(convertType(t1), convertType(t2))
            case NonTerminal("t_fact", _) :: Nil => convertType(children.head)
            case _ =>  throw MissingCSTTypeCaseException(nodeType, children)
          }
          case "t_fact" => children match {
            case Terminal("\"bool\"", _) :: Nil => TSimple(new TBool)
            case Terminal("\"int\"", _) :: Nil => TSimple(new TInt)
            case Terminal("\"unit\"", _) :: Nil => TSimple(new TUnit)
            case Terminal("\"(\"", _) :: t1 :: Terminal("\")\"", _) :: Nil => convertType(t1)
            case t1 :: Terminal("\"ref\"", _) :: Nil => TRef(convertType(t1))
            case _ =>  throw MissingCSTTypeCaseException(nodeType, children)
          }
        }
      case Terminal(nodeType, _) => throw MissingCSTTypeCaseException(nodeType, Nil)
    }
  }

  def convertSequence(seq: ConcreteSyntaxTree) : List[AST] = {
    seq match {
      case NonTerminal(nodeType, children) => children match {
        case NonTerminal("expr", _) :: Nil => convert(children.head) :: Nil
        case expr :: Terminal("\";\"", _) :: rest :: Nil => convert(expr) :: convertSequence(rest)
        case _ => throw MissingCSTCaseException(nodeType, children)
      }
      case Terminal(nodeType, _) => throw  MissingCSTCaseException(nodeType, Nil)
    }
  }

  def convertUOp(op: ConcreteSyntaxTree, e: AST) : AST = {
    op match {
      case NonTerminal(nodeType, children) =>
        children match {
          case Terminal("\"-\"", _) :: Nil => SUnaryOp(new NEG, e)
          case Terminal("\"~\"", _) :: Nil => SUnaryOp(new NOT, e)
          case Terminal("\"ref\"", _) :: Nil => SRef(e)
          case Terminal("\"!\"", _) :: Nil => SDeref(e)
          case Terminal("\"snd\"", _) :: Nil => SSnd(e)
          case Terminal("\"fst\"", _) :: Nil => SFst(e)
          case Terminal("\"inl\"", _) :: t :: Nil => SInl(convertType(t), e)
          case Terminal("\"inr\"", _) :: t :: Nil => SInr(convertType(t), e)

          case _ => throw  MissingCSTCaseException(nodeType, children)
        }
      case Terminal(nodeType, _) => throw  MissingCSTCaseException(nodeType, Nil)
    }
  }

  def convertConst(c: ConcreteSyntaxTree) : AST = {
    c match {
      case NonTerminal("const", children) => children match {
        case Terminal("num", value) :: Nil => SInt(value.toInt)
        case NonTerminal("unit", _) :: Nil => SUnit()
        case Terminal("\"true\"", _) :: Nil => SBoolean(true)
        case Terminal("\"false\"", _) :: Nil => SBoolean(false)
        case Terminal("what", _) :: Nil => SUnaryOp(new READ, new SUnit)
        case _ => throw MissingCSTCaseException("const", children)
      }
      case NonTerminal(nodeType, children) =>  throw MissingCSTCaseException(nodeType, children)
      case _ :Terminal =>  throw MissingCSTCaseException(c.nodeType, Nil)
    }
  }

  def convertTypeOption(t: ConcreteSyntaxTree) : Option[Type] = {
    t match {
      case NonTerminal(nodeType, children) =>
        nodeType match {
          case "opt_t_expr" =>
            children match {
              case Terminal("\":\"", _) :: t_expr :: Nil => Some(convertType(t_expr))
              case Nil => None
              case _ => throw MissingCSTTypeCaseException(t.nodeType, children)
            }
          case _ => throw MissingCSTTypeCaseException(t.nodeType, children)
        }
      case _ => throw MissingCSTTypeCaseException(t.nodeType, Nil)
    }
  }
}
