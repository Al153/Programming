package Exceptions

/**
  * Created by Al on 11/03/2017.
  */
case class UnrecognisedTokenException(tokenName: String)extends Throwable {
  override def toString: String = s"Unrecognised token: '$tokenName'"
}