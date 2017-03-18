package Exceptions

/**
  * Created by Al on 11/03/2017.
  */
case class EmptyParseStackException(message: String = "Error, parse stack is empty", cause: Throwable = null)
  extends Exception(message, cause)