package Exceptions

/**
  * Created by Al on 11/03/2017.
  */
case class PALConfigException (attributePath: List[String], cause: Throwable = null)
  extends Exception("PAL config is missing the field " + attributePath.mkString("."), cause)