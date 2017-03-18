package BackEnd
 
import Parsing.SyntaxTree.{AST, SBoolean, SUnit}

/**
  * Created by Al on 15/03/2017.
  */
object CompileAST {
  def apply(c: AST): List[ByteCode]  = comp(c, Nil) match {
    case (defs, code) => code ++ (new BHalt :: Nil) ++ defs
  }

  def comp(c: AST, vmap: List[(String, StackLocation)]): (List[ByteCode], List[ByteCode]) = {
    c match {
      case SUnit() => (Nil, List(BPush(new StackUnit)))
      case SBoolean(b) => (Nil, List(BPush(new StackBool(b))))
    }
  }

  def compLambda(vmap: List[(String,StackLocation)]) = {
    (fOpt: Option)
  }
}
