package Exceptions

import Parsing.SyntaxTree.{ConcreteSyntaxTree, Terminal}

/**
  * Created by Al on 11/03/2017.
  */
case class SlangSyntaxError(
                            message: String,
                            cause: Throwable = null
                           )
  extends Exception(message, cause)