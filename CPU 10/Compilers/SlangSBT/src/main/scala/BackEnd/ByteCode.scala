package BackEnd

import Parsing.SyntaxTree.{Operator, UnaryOperator}

/**
  * Created by Al on 14/03/2017.
  */
sealed abstract class ByteCode {
  // def pretty(indent: Int): String
  // def assemble(): String
}

case class BPush(s: StackItem) extends ByteCode {
  // override def pretty(indent: Int) = ???
  // override def assemble() = ???
}

case class BLookup(p: ValuePath) extends ByteCode {}
case class BUnary(op: UnaryOperator) extends ByteCode {}
case class BOperator(op: Operator) extends ByteCode {}
case class BAssign() extends ByteCode {}
case class BSwap() extends ByteCode {}
case class BPop() extends ByteCode {}
case class BFst() extends ByteCode {}
case class BSnd() extends ByteCode {}
case class BDeref() extends ByteCode {}
case class BApply() extends ByteCode {}
case class BReturn() extends ByteCode {}
case class BMakePair() extends ByteCode {}
case class BMakeInl() extends ByteCode {}
case class BMakeInr() extends ByteCode {}
case class BMakeClosure(l: Location, i: Int) extends ByteCode {}
case class BTest(l: Location) extends ByteCode {}
case class BCase(l: Location) extends ByteCode {}
case class BGoto(l: Location) extends ByteCode {}
case class BLabel(label: String) extends ByteCode {}
case class BHalt() extends ByteCode {}

