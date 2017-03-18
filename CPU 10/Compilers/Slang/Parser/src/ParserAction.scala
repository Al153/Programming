/**
  * Created by Al on 10/03/2017.
  */
sealed abstract trait ParserAction
case class Shift(i: Int)
  extends ParserAction
case class Reduce(r: Rule)
  extends ParserAction
case class Done()
  extends ParserAction
case class ActionError()
  extends ParserAction