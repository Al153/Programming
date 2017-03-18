package BackEnd

sealed abstract class ValuePath
case class StackLocation(i: Int) extends ValuePath {}
case class HeapLocation(i: Int) extends ValuePath {}