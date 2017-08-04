package Exceptions

/**
  * Created by Al on 11/03/2017.
  */
case class PALConfigException (attributePath: List[String])
  extends Throwable{
  override def toString: String = "PAL config is missing the field " + attributePath.mkString(".")
}