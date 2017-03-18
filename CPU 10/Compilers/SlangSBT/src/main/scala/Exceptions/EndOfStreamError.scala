package Exceptions

/**
  * Created by Al on 11/03/2017.
  */
case class EndOfStreamError()
  extends  Exception("Error: unexpected end of input stream")