package Exceptions

/**
  * Created by Al on 12/04/2017.
  */
case class CompileFindException(id: String) extends Throwable {
  override def toString: String = "Could not find id: "+ id
}
