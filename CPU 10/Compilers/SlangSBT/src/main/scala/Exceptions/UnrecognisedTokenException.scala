package Exceptions

/**
  * Created by Al on 11/03/2017.
  */
case class UnrecognisedTokenException(tokenName: String, cause: Throwable = null)
  extends Exception("Unrecognised token: '"+tokenName+"'", cause)