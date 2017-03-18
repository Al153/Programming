package Exceptions

import Parsing.SyntaxTree.ConcreteSyntaxTree

/**
  * Created by Al on 11/03/2017.
  */
case class NoStateException(stackValue: ConcreteSyntaxTree, cause: Throwable = null)
  extends Exception("State on stack has no state value: "+stackValue.nodeType, cause)