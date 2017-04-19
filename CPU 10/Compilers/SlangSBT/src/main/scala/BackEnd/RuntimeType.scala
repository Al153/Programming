package BackEnd

/**
  * Created by Al on 12/04/2017.
  */
sealed trait RuntimeType extends Ordered[RuntimeType]{
  var length: Int // Length of type in cells
  var offset: Int // offset into type where garbage collected values can be found
  var name: String
  def registerType(name: String): String = {
    length.toString + " " + offset.toString + " TYPE " + name
  }
}
case class Closure(n: Int) extends RuntimeType {
  var length: Int = n + 2
  var offset: Int = 2
  var name: String = "cl_" ++ n.toString

  def compare(that: RuntimeType): Int = that match {
    case Closure(m) => n - m // closures should be ordered by length
    case EndOfClosures() => -1 // comes before end of closures
    case DefinedType(_, _, _) => -1 // closures come before defined types
  }
}
  case class EndOfClosures() extends  RuntimeType {
    var offset: Int = 0
    var length: Int = 0
    // an imaginary sentinel value that is used to indicate the end of closures
    var name: String = "EndOfClosures"
    def compare(that: RuntimeType): Int = that match {
      case EndOfClosures() => 0
      case Closure(_) => 1          // comes after closures
      case DefinedType(_, _, _) => -1 // comes before Defined types
    }

    override def registerType(name: String): String = "SET_LIM"
}
case class DefinedType(var name: String, var length: Int, var offset: Int) extends RuntimeType {
  def compare(that: RuntimeType): Int = that match {
    case Closure(_) => 1 // closures come first
    case EndOfClosures() => 1 // end of closures also comes first
    case DefinedType(n, l, o) =>
      if (!n.equals(name)){
        name.compareTo(n)
      } else if (length != l) { // otherwise sort by length, then offset
        length-l
      } else {
         offset-o
      }
    }
}
