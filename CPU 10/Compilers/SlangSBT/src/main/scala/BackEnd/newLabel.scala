package BackEnd

/**
  * Created by Al on 19/04/2017.
  */
object newLabel {
  var labelIndex = 0

  def apply: String = {
    val result = "L" + labelIndex.toString
    labelIndex += 1
    result
  }
}
