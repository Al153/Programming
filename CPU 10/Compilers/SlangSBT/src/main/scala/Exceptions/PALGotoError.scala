package Exceptions

/**
  * Created by Al on 12/03/2017.
  */
case class PALGotoError (state: String, token: String, cause :Throwable = null)
  extends Exception(
    "PAL\\Parser\\goto_table is malformed" +
      "for state = "+ state + " " +
      "and token = "+ token +". Should be an integer in string form.",
    cause)

