package Exceptions

import Parsing.SyntaxTree.ConcreteSyntaxTree

/**
  * Created by Al on 13/03/2017.
  */
case class MissingCSTCaseException( nodeType: String, children: List[ConcreteSyntaxTree], cause: Throwable = null)
  extends Throwable {
  override def toString: String =
    s"""
       | Missing translation case for
       | $nodeType ${children.map(_.nodeType).mkString(", ")}
     """.stripMargin
}
