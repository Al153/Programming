package Exceptions

/**
  * Created by Al on 12/03/2017.
  */
case class PALGotoError (state: String, token: String)
  extends Throwable {
    override def toString: String =
        "PAL\\Parser\\goto_table is malformed" +
          "for state = " + state + " " +
          "and token = " + token + ". Should be an integer in string form."
}

