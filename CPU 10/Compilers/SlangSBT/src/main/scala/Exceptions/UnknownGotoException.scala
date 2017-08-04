package Exceptions

import Parsing.SyntaxTree.NonTerminal

/**
  * Created by Al on 11/03/2017.
  */
case class UnknownGotoException(n: NonTerminal, state: Int) extends Throwable{
  override def toString = s"Error, do not know what to do with NT token: ${n.nodeType} in state: $state\n${n.pretty()}"
}