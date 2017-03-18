package BackEnd

sealed abstract class StackItem
case class StackInt(i: Int) extends StackItem
case class StackBool(b: Boolean) extends StackItem
case class StackUnit() extends StackItem
case class StackHeapIndex(hi: Int) extends StackItem
case class StackReturnAddress(ra: Int) extends StackItem
case class StackFramePointer(si: Int) extends  StackItem