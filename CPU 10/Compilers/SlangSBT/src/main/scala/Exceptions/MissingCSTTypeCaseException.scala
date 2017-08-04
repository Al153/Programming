package Exceptions

import Parsing.SyntaxTree.ConcreteSyntaxTree

/**
  * Created by Al on 13/03/2017.
  */
case class MissingCSTTypeCaseException(nodeType: String, children: List[ConcreteSyntaxTree])
  extends Throwable{
  override def toString: String =
    s"""
       | Missing type translation case for $nodeType
       |     ${children.map(_.nodeType).mkString(", ")}
     """.stripMargin
}




