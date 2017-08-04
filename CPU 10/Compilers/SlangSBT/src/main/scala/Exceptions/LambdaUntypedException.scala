package Exceptions

/**
  * Created by Al on 24/04/2017.
  */
case class LambdaUntypedException() extends Throwable{
  override def toString: String =
  "getArgType was called on a lambda function before its type had been evaluated"
}
