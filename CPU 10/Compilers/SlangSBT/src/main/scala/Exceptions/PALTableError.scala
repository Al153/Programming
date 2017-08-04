package Exceptions

/**
  * Created by Al on 12/03/2017.
  */
case class PALTableError (state: String, token: String)extends Throwable {
    override def toString: String =
        "PAL\\Parser\\lookahead_action_table is malformed" +
          "for state = " + state + " " +
          "and token = " + token + ". Should be [shift, n]," +
          " [reduce, n], or [done]."
}
