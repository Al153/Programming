package Parsing

import Exceptions.UnmatchedCommentException

import scala.collection.immutable.Queue

/**
  * Created by Al on 21/04/2017.
  */
object PreProcessor {
  def preProcess(s: String): String ={
   s.replaceFirst("\\(\\*.*\\*\\)", "")

    val chars = s.toList
    val noComments = removeComments(chars)
    noComments.mkString("")
  }

  def removeComments(in: List[Char]): List[Char] ={
    var input: List[Char] = in
    var result: Queue[Char] = Queue()
    var continue = true
    while (continue) {
      input match {
        case Nil => continue = false
        case '(' :: '*' :: rest =>
          var innerContinue = true
          input = rest
          while (innerContinue){
            input match {
              case Nil => throw UnmatchedCommentException()
              case '*' :: ')' :: innerRest =>
                input = innerRest
                innerContinue = false
              case _ :: innerRest =>
                input = innerRest
            }
          }
        case c::rest =>
          result = result.enqueue(c)
          input = rest
      }
    }
    result.toList
  }

  def endComment(input: List[Char]): List[Char] ={
    // scrolls to the end of the comment
    input match {
      case Nil => throw UnmatchedCommentException()
      case '*' :: ')' :: rest => removeComments(rest)
      case c :: rest => endComment(rest)
    }
  }
}
