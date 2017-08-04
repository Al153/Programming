package Exceptions

/**
  * Created by Al on 13/04/2017.
  */
case class MissingIndexException() extends Throwable{
  override def toString = "Missing code index in a location"
}
