package BackEnd
 
import Exceptions.CompileFindException
import Parsing.SyntaxTree._

import scala.collection.immutable.HashMap

/**
  * Created by Al on 15/03/2017.
  */

// Compiler should produce three outputs:
  // Types used
    // By default:
        // some number of closures
        // Refs
        // Sums
        // Products
  // definitions of functions
  // main code

object CompileAST {
  val defaultTypes = List(
    DefinedType("default_pair", 3, 1),
    DefinedType("default_sum", 3, 2),
    DefinedType("default_ref", 2, 1),
    Closure(0)
  )
  def apply(c: AST): String  = comp(defaultTypes, c, Nil) match {
    case (types, defs, code) => render( types, code ++ (new BHalt :: Nil) ++ defs)
  }

  def comp(types: List[RuntimeType], c: AST, vmap: List[(String, ValuePath)]): (List[RuntimeType], List[ByteCode], List[ByteCode]) = {
    c match {
      case SUnit() => (types, Nil, List(BPush(new StackUnit)))
      case SBoolean(b) => (types, Nil, List(BPush(StackBool(b))))
      case SInt(i) => (types, Nil, List(BPush (StackInt(i))))
      case SUnaryOp(op, expr) =>
        val (types1, defs, c1) = comp(types, expr, vmap)
        (types1, defs, c1 ++ List(BUnary(op)))

      case SOp(op, e1, e2) =>
        val (types1, defs1, c1) = comp(types, e1, vmap)
        val (types2, defs2, c2) = comp(types1, e2, vmap)
              (types2, defs1 ++ defs2, c1 ++ c2 ++ List(BOperator(op)))

      case SPair(e1, e2) =>
        val (types1, defs1, c1) = comp(types, e1, vmap)
        val (types2, defs2, c2) = comp(types1, e2, vmap)
        (types2, defs1 ++ defs2, c1 ++ c2 ++ List(new BMakePair))

      case SFst(e) =>
        val (types1, defs, c1) = comp(types, e, vmap)
        (types1, defs, c1 ++ List(new BFst))

      case SSnd(e) =>
        val (types1, defs, c1) = comp(types, e, vmap)
        (types1, defs, c1 ++ List(new BSnd))

      case SInl(_, e) => // can ignore type
        val (types1, defs, c1) = comp(types, e, vmap)
        (types1, defs, c1 ++ List(new BMakeInl))

      case SInr(_, e) => // can ignore type
        val (types1, defs, c1) = comp(types, e, vmap)
        (types1, defs, c1 ++ List(new BMakeInr))

      case SCase(e1, lam1, lam2) => // TODO: this implementation

        val inr_label = newLabel.apply
        val after_inr_label = newLabel.apply
        val (types1, defs1, c1) = comp(types, e1, vmap)
        val (types2, defs2, c2) = comp(types1, SLambda(lam1), vmap)
        val (types3, defs3, c3) = comp(types2, SLambda(lam2), vmap)
        (
          types3,
          defs1 ++ defs2 ++ defs3,
          c1 ++
            (BCase(new Location(inr_label, None)) :: new BStartCase :: c2) ++
          List(new BApply, new BEndCase , BGoto(new Location(after_inr_label, None)), BLabel(inr_label), new BStartCase) ++
          c3 ++ List(new BApply, new BEndCase, BLabel(after_inr_label))
        )
      case SIf(e1, e2, e3) =>
        val elseLabel: String = newLabel.apply
        val afterElseLabel: String = newLabel.apply

        val (types1, defs1, c1) = comp(types, e1, vmap)
        val (types2, defs2, c2) = comp(types1, e2, vmap)
        val (types3, defs3, c3) = comp(types2, e3, vmap)
        (
          types3,
          defs1++defs2++defs3,
            c1 ++ List(BTest(new Location(elseLabel, None))) ++
            List(new BStartIf) ++ c2 ++ List(new BEndIf, BGoto(new Location(afterElseLabel, None)), BLabel(elseLabel)) ++
              List(new BStartIf) ++ c3 ++ List(new BEndIf,BLabel(afterElseLabel))
        )

      case SSeq(l) =>
        l match {
          case Nil => (types, Nil, Nil)
          case e :: Nil => comp(types, e, vmap)
          case e :: rest =>
            val (types1, defs1, c1) = comp(types, e, vmap)
            val (types2, defs2, c2) = comp(types1, SSeq(rest), vmap)
            (types2, defs1 ++ defs2, c1 ++ c2)
        }

      case SRef(e) =>
        val (types1, defs, c1) = comp(types, e, vmap)
        (types1, defs, c1 ++ List(new BMakeRef))
      case SDeref(e) =>
        val (types1, defs, c1) = comp(types, e, vmap)
        (types1, defs, c1 ++ List(new BDeref))

      case SWhile(e1, e2) =>
        val endLabel: String = newLabel.apply
        val testLabel: String = newLabel.apply
        val (types1, defs1, c1) = comp(types, e1, vmap)
        val (types2, defs2, c2) = comp(types1, e2, vmap)
        (
          types2,
          defs1++defs2,
          BLabel(testLabel) :: c1
            ++ List(BTest(new Location(endLabel, None))) ++
            List(new BStartWhile) ++ c2 ++ List(new BPop, new BEndWhile, BGoto(new Location(testLabel, None)),
            BLabel(endLabel), BPush(StackUnit()))
        )
      case SAssign(e1, e2) =>
        val (types1, defs1, c1) = comp(types, e1, vmap)
        val (types2, defs2, c2) = comp(types1, e2, vmap)
        (types2, defs1 ++ defs2, c1 ++ c2 ++ List(new BAssign))

      case SApp(e1, e2) =>

        val (types1, defs1, c1) = comp(types, e1, vmap)
        val (types2, defs2, c2) = comp(types1, e2, vmap)
        (types2, defs1 ++ defs2, c2 ++ c1 ++ List(new BApply))

      case SVar(x) => (types, Nil, List(BLookup(find(vmap, x))))
      case SLetFun(f, lam1, t, e2) => comp(types, SApp(SLambda(new Lambda(f, e2, t)), SLambda(lam1)) , vmap)
      case SLambda(l) =>
        compLambda(types, vmap) (None, l.getArg, l.getExpr)
      case SLetRecFun(f, l, t, e2) =>
        val newF = newLabel.apply
        val newLambda = l.alpha(f, newF)
        val newExpr = e2.alpha(f, newF)

        val (types1, defs1, c1) = comp(types, SLambda(new Lambda(newF, newExpr, t)), vmap)
        val (types2, defs2, c2) = compLambda( types1, vmap) (Some(newF), newLambda.getArg, newLambda.getExpr)

        (types2, defs1 ++ defs2, c2 ++ c1 ++ List(new BApply))
    }
  }

  def compLambda(types: List[RuntimeType], vmap: List[(String, ValuePath)])
    : (Option[String], String, AST) => (List[RuntimeType] , List[ByteCode], List[ByteCode])
    = {
    (fOpt, x, e) => {
      val (
        boundVars: List[String],
        f : String,
        fBind: List[(String, StackLocation)]
        ) = fOpt match {
        case None => (x::Nil, newLabel.apply, Nil)
        case Some(fun) => (x :: fun :: Nil, fun, (fun, StackLocation(-1))::Nil)
      }

      def positions(l: List[String]): List[(String,Int)] ={
        def aux(k: Int, l: List[String]): List[(String, Int)] = l match {
          case Nil => Nil
          case (a::rest) => (a, k) :: aux(k + 1, rest)
        }
        aux(1, l)
      }

      val xBind = (x, StackLocation(-2))
      val fvars = e.getFreeVars(boundVars)

      val fetchFVars = fvars.map((y:String) => BLookup(find(vmap, y)))
      val fvarBind: ((String,Int)) => (String, ValuePath) =
      {case (y, p) => (y, HeapLocation(p))}
      val envBind = positions(fvars).map(fvarBind)
      val newVMap = xBind :: (fBind ++ envBind ++ vmap)
      val (types1, definitions: List[ByteCode], code) = comp(types, e, newVMap)
      val thisDef = BLabel(f) :: new BStartFunction :: code ++ List(new BReturn, new BEndFunction)
      val n = fvars.length
      (
        Closure(n) :: types1,
        thisDef ++ definitions,
        fetchFVars.reverse ++ List(BMakeClosure(new Location(f, None), n))
      )
    }
  }

  def render(types: List[RuntimeType], code: List[ByteCode]): String= {
    val sortedTypes = types.sorted // sort types
    val filledTypes = fillInClosures(sortedTypes, 0)  // fill in closures
    // register all types and create code to mark the end of closures
    val typeString = filledTypes map((x: RuntimeType) => x.registerType(forthTypeName(x.name)))
    // create the code to mark end of closures
    // set variables for the default types
    val defaultTypesString = List(
      forthTypeName("default_pair") + " t_PAIR !",
      forthTypeName("default_sum") + " t_SUM !",
      forthTypeName("default_ref") + " t_SUM !",
      "hex " + (typeString.length * 4).toHexString + " TypeLim !" // set the typeLim value
    )
    // TODO: convert names to forth viable ones

    def convertLabelName(x: ByteCode): ByteCode = { // TODO needs to do locations too
      x match { // todo fill in
        case _ => x
      }
    }

    def isLabel(x: ByteCode): Boolean = {
      x match {
        case BLabel(_) => true
        case _ => false
      }
    }

    def createLabel(x: ByteCode): String = {
      x match {
        case BLabel(id) => "LABEL: "+ id
        case _ => ""
      }
    }

    val labelDeclarations = code.filter(isLabel).map(createLabel)


    // scan code for labels and create their definitions
    // convert code to strings
    val initInstr = List("BINIT")

    (labelDeclarations ++ typeString ++ defaultTypesString ++ initInstr ++ code.map(x=>x.render())).mkString("\n")
  }

  private def fillInClosures(in: List[RuntimeType], expected: Int): List[RuntimeType] = {
    // TODO: needs a zero closure
    in match {
      case Closure(m):: rest =>
        if (m == expected) {
          Closure(m):: fillInClosures(rest, expected + 1)
        } else if (m>expected){
          Closure(expected) :: fillInClosures(in, expected + 1)
        } else {
          // if m < expected, duplicate closure, delete
          fillInClosures(rest, expected)
        }
      case _ => EndOfClosures() :: in
    }
  }

  var typeIndex = 0
  var typeLookup = new HashMap[String,String]
  private def forthTypeName(name: String): String = {
      typeLookup.get(name) match {
        case Some(n) => n
        case None =>
          val result: String = "T" + typeIndex.toString
          typeLookup = typeLookup +  (name -> result)
          typeIndex += 1
          result
      }
  }

  var nameIndex = 0
  var nameLookup = new HashMap[String,String]
  private def forthName(name: String): String = {
    nameLookup.get(name) match {
      case Some(n) => n
      case None =>
        val result: String = "N" + typeIndex.toString
        nameLookup = nameLookup +  (name -> result)
        typeIndex += 1
        result
    }
  }

  private def find(list: List[(String, ValuePath)], id: String): ValuePath ={
    list match {
      case Nil => throw new CompileFindException(id)
      case (x, loc):: rest =>
        if (x == id) {
          loc
        } else {
          find(rest, id)
        }
    }
  }
}
