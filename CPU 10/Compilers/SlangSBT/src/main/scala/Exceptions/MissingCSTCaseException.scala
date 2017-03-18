package Exceptions

import Parsing.SyntaxTree.ConcreteSyntaxTree

/**
  * Created by Al on 13/03/2017.
  */
class MissingCSTCaseException( nodeType: String, children: List[ConcreteSyntaxTree], cause: Throwable = null)
  extends Exception(
    "Missing translation case for "+
      nodeType + " " +
      children.map((x:ConcreteSyntaxTree) => x.nodeType).mkString(", "),
    cause
  )
