package Parsing

/**
  * Created by Al on 21/04/2017.
  */
sealed trait Token
case class UnParsedToken(s: String, c: Int, r: Int) extends Token
