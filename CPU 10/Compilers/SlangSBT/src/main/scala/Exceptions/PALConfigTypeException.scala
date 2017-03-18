package Exceptions

/**
  * Created by Al on 11/03/2017.
  */
case class PALConfigTypeException (
                                    expectedType: String,
                                    attributePath: List[String],
                                    cause: Throwable = null
                                  ) extends Exception(
  "PAL config is has a type mismatch under path "
    + attributePath.mkString(".")
    + " Expected: " + expectedType,
    cause)