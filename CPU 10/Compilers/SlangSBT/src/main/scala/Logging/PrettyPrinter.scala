package Logging

/**
  * Created by Al on 12/03/2017.
  */
object PrettyPrinter {
  def indentation(indent: Int): String = {
    var str = ""
    for (_ <- 1 to indent ){
      str += "\t"
    }
    str
  }
}