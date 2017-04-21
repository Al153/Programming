package Exceptions

/**
  * Created by Al on 21/04/2017.
  */
case class UnmatchedCommentException(cause: Throwable = null) extends  Exception("Error: unmatched comment: *)",cause){

}
