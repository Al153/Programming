package CSP

/**
  * Created by Al on 12/05/2017.
  */
sealed abstract class Colour {

}

case class Red() extends Colour {
  override def toString: String = "R"
}

case class Cyan() extends Colour {
  override def toString: String = "C"
}

case class Black() extends Colour {
  override def toString: String = "B"
}
