package BackEnd

import Parsing.SyntaxTree._

/**
  * Created by Al on 14/03/2017.
  */
sealed abstract class ByteCode {
  def render(): String
  def tab(s: String): String = "\t"+s
  def twoTab(s: String): String = "\t\t"+s
}

case class BPush(s: StackItem) extends ByteCode {
  val primitiveHeader = 0x80000000
  val t = 0x7fffffff
  val f = 0x0
  private def toPrimitive(i: Int) = "hex " +  (i|primitiveHeader).toHexString + " BPUSH"
  private def toHeapType(ref: Int) = "hex " + (ref&(~primitiveHeader)).toHexString + " BPUSH"
  override def render(): String = {
    twoTab(
      s match {
        case StackUnit() => toPrimitive(0)
        case StackInt(i) => toPrimitive(i)
        case StackBool(true) => toPrimitive(t)
        case StackBool(false) => toPrimitive(f)
        case StackHeapIndex(hi) => toHeapType(hi)
        case StackReturnAddress(ra) => toHeapType(ra)
        case StackFramePointer(si) => toHeapType(si)
      }
    )
  }
}

case class BLookup(p: ValuePath) extends ByteCode {
  override def render(): String = {
    twoTab(
      p match {
        case StackLocation(sl) =>
          if (sl == -1) {
            "SELF BLOOKUPS"
          } else if (sl == -2) {
            "ARG BLOOKUPS"
          } else {
            "hex " + sl.toHexString + " BLOOKUPS"
          }
        case HeapLocation(hl) => "hex " + (hl-1).toHexString + " BLOOKUPH" // -1 to change to correct addressing
      }
    )
  }
}
case class BUnary(op: UnaryOperator) extends ByteCode {
  override def render(): String = {
    val opString = op match {
      case NEG() => "U_NEG"
      case NOT() => "U_NOT"
      case READ() =>"U_READ"
    }
    twoTab(
      opString + " BUNARY"
    )
  }
}
case class BOperator(op: Operator) extends ByteCode {
  override def render(): String = {
    val opString = op match {
      case ADD() => "O_ADD"
      case SUB() => "O_SUB"
      case EQ() => "O_EQI"
      case LT() => "O_LT"
      case MUL() => "O_MUL"
      case OR() => "O_OR"
      case AND() => "O_AND"
    }

    twoTab(opString + " BOPER")
  }
}
case class BAssign() extends ByteCode {
  override def render(): String = twoTab("BASSIGN")
}
case class BSwap() extends ByteCode {
  override def render(): String = twoTab("BSWAP")
}
case class BPop() extends ByteCode {
  override def render(): String = twoTab("BPOP")
}
case class BFst() extends ByteCode {
  override def render(): String = twoTab("BFST")
}
case class BSnd() extends ByteCode {
  override def render(): String = twoTab("BSND")
}
case class BDeref() extends ByteCode {
  override def render(): String = twoTab("BDEREF")
}
case class BApply() extends ByteCode {
  override def render(): String = twoTab("BAPPLY")
}
case class BReturn() extends ByteCode {
  override def render(): String = twoTab("BRETURN")
}
case class BMakePair() extends ByteCode {
  override def render(): String = twoTab("BMK_PAIR")
}
case class BMakeInl() extends ByteCode {
  override def render(): String = twoTab("BMK_INL")
}
case class BMakeInr() extends ByteCode {
  override def render(): String = twoTab("BMK_INR")
}
case class BMakeClosure(loc: Location, length: Int) extends ByteCode {
  override def render(): String = {
    twoTab(loc.label + " hex " + length.toHexString + " BMK_CLOSURE")
  }
}
case class BMakeRef() extends ByteCode {
  override def render(): String = twoTab("BMK_REF")
}
case class BTest(l: Location) extends ByteCode {
  override def render(): String = {
    twoTab(l.label + " " + " BTEST")
  }
}
case class BCase(l: Location) extends ByteCode {
  override def render(): String = {
    twoTab(l.label + " BCASE")
  }
}
case class BGoto(l: Location) extends ByteCode {
  override def render(): String = {
    twoTab(l.label + " BGOTO")
  }
}
case class BLabel(label: String) extends ByteCode {
  override def render(): String = {
    label + " BLABEL"
  }
}
case class BHalt() extends ByteCode {
  override def render(): String = twoTab("BHALT")
}

// Non executable byte codes
// these byte codes are for use by the assembler for managing register stack manipulation
// these can be ignored  by other jargon implementations

// start and end of a function block
case class BStartFunction() extends  ByteCode {
  override def render(): String = tab("BSTART_F")
}

case class BEndFunction() extends  ByteCode {
  override def render(): String = tab("BEND_F")
}

case class  BStartIf() extends  ByteCode {
  override def render(): String = tab("BSTART_I")
}

case class  BEndIf() extends  ByteCode {
  override def render(): String = tab("BEND_I")
}
case class  BStartElse() extends  ByteCode {
  override def render(): String = tab("BSTART_E")
}

case class  BEndElse() extends  ByteCode {
  override def render(): String = tab("BEND_E")
}

case class  BStartWhile() extends  ByteCode {
  override def render(): String = tab("BSTART_W")
}

case class BEndWhile() extends  ByteCode {
  override def render(): String = tab("BEND_W")
}

case class BStartLeftCase() extends ByteCode {
  override def render(): String = tab("BSTART_L")
}

case class BEndLeftCase() extends  ByteCode {
  override def render(): String = tab("BEND_L")
}


case class BStartRightCase() extends ByteCode {
  override def render(): String = tab("BSTART_R")
}

case class BEndRightCase() extends  ByteCode {
  override def render(): String = tab("BEND_R")
}