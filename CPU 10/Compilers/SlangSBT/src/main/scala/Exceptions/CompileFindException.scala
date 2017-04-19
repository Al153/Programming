package Exceptions

/**
  * Created by Al on 12/04/2017.
  */
class CompileFindException(id: String, cause: Throwable = null) extends Exception("Could not find id: "+ id, cause){}
