package Parsing

import Exceptions.UnmatchedCommentException

/**
  * Created by Al on 21/04/2017.
  */
object PreProcessor {
  def preProcess(s: String): String ={
    val chars = s.toList
    val noComments = removeComments(chars)
    noComments.mkString("")
  }

  def removeComments(input: List[Char]): List[Char] ={
    input match {
      case Nil => Nil
      case '(' :: '*' :: rest => endComment(rest)
      case c::rest => c::removeComments(rest)
    }
  }
  def endComment(input: List[Char]): List[Char] ={
    // scrolls to the end of the comment
    input match {
      case Nil => throw new UnmatchedCommentException()
      case '*' :: ')' :: rest => removeComments(rest)
      case c :: rest => endComment(rest)
    }
  }
}
