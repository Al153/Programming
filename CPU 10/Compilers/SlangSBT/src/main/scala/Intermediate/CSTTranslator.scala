package Intermediate

import Parsing.SyntaxTree.ConcreteSyntaxTree

/**
  * Created by Al on 25/04/2017.
  */
abstract class CSTTranslator {
  def apply(c: ConcreteSyntaxTree): AST;
}
