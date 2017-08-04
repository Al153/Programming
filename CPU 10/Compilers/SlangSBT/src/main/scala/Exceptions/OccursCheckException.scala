package Exceptions

/**
  * Created by Al on 23/04/2017.
  */
case class OccursCheckException(id: Int, cause: Throwable = null)
  extends Exception("Internal occurs check exception thrown", cause) {}
