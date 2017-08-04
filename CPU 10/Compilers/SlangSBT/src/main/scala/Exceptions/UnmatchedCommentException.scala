package Exceptions

/**
  * Created by Al on 21/04/2017.
  */
case class UnmatchedCommentException() extends Throwable{
  override def toString = "Error: unmatched comment: *)"
}