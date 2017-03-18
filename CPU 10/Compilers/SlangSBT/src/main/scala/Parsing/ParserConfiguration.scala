package Parsing

import Exceptions.{PALConfigException, PALConfigTypeException, PALGotoError, PALTableError}
import play.api.libs.json._

import scala.collection.immutable.HashMap

/**
  * Created by Al on 12/03/2017.
  */
class ParserConfiguration(var config: String) {
  private val cfgDict : JsValue = Json.parse(config)
  private val parserConfig = cfgDict\"Parser"
  private val parserGotoTable = parserConfig\"goto_table"
  private val parserLookaheadTable = parserConfig\"lookahead_action_table"
  private val parserRules = parserConfig\"rules"
  private val lexerConfig = cfgDict\"Lexer"
  private val lexerDFAs = lexerConfig\"dfas"
  private val lexerRules = lexerConfig\"rules"
  private val terminals = cfgDict\"Terminals"
  private val elementaryTokens = cfgDict\"ElementaryTokens"
  private val toIgnore = cfgDict\"Ignore"

  verifyFieldList(
    List(
      (parserConfig, List("Parser")),
      (parserGotoTable, List("Parser", "goto_table")),
      (parserLookaheadTable, List("Parser", "lookahead_action_table")),
      (parserRules, List("Parser", "rules")),
      (lexerConfig, List("Lexer")),
      (lexerDFAs, List("Lexer", "dfas")),
      (lexerRules, List("Lexer", "rules")),
      (terminals, List("Terminals")),
      (elementaryTokens, List("ElementaryTokens")),
      (toIgnore, List("Ignore"))
      )
    )

  private val DecodedElementaryTokens = getJSONArrayAsStringList(elementaryTokens, List("ElementaryTokens"))
  private val DecodedToIgnore = getJSONArrayAsStringList(toIgnore, List("Ignore"))
  private val DecodedLexerRules = getJSONArrayAsStringList(lexerRules, List("Lexer", "rules"))
  private val DecodedTerminals = getJSONArrayAsStringList(terminals, List("Terminals"))
  private val DecodedParserRules = parserRules.as[List[JsArray]].map(getParserRule)
  private val lexer: Lexer = new Lexer(lexerDFAs.as[JsObject], DecodedLexerRules, DecodedElementaryTokens, DecodedToIgnore)
  private val lookaheadActionTable : Map[(Int, String), ParserAction] = {
    buildLookaheadTable(parserLookaheadTable.as[JsObject], DecodedParserRules)
  }
  private val gotoTable : Map[(Int,String), Int] = buildGotoTable(parserGotoTable.as[JsObject])



  def getLexer: Lexer = {
    lexer
  }

  def getLookaheadActionTable :Map[(Int, String), ParserAction] = {
    lookaheadActionTable
  }

  def getGotoTable :Map[(Int,String), Int] = {
    gotoTable
  }



  private def verifyFieldList(values: List[(JsLookupResult, List[String])]): Unit ={
    // verify that the list of JsLookupResults are defined
    values match {
      case Nil => ()
      case field::fields =>
        field._1 match {
          case _: JsUndefined => throw PALConfigException(field._2)
          case JsDefined(_) => verifyFieldList(fields)
        }
    }
  }

  private def getJSONArrayAsStringList(jsonList: JsLookupResult, path: List[String]) : List[String] = {
    // Tries to decode to a string list
    try {
      jsonList.as[List[String]]
    } catch {
      case  _:JsResultException => throw PALConfigTypeException("List[String]", path)
    }
  }

  private def getParserRule(JSONRule: JsArray) : Rule = {
    // JSONRule = (lhsName, rhsArray, number), returns a rule instance
    JSONRule match {
      case JsArray(lhsName +: rhsArray +: number +: _) =>
        try {
          val lhs = lhsName.as[String]
          val rhs = rhsArray.as[List[String]]
          val n = number.as[Int]
          new Rule(lhs , rhs, n)
        } catch {
          case _:JsResultException => throw PALConfigTypeException("(String, List[String], int)", List("Parser", "rules", "_"))
        }
      case _ => throw PALConfigTypeException("[String, List[String], int]", List("Parser","rules"))
    }
  }

  private def buildLookaheadTable(JSONActionTable: JsObject, rules: List[Rule]): Map[(Int, String), ParserAction] = {
    var table = new HashMap[(Int, String), ParserAction]
    for((stateNumber, transitions) <- JSONActionTable.fields){
      // transitions is a map from token -> [action, metadata]
      val state = stateNumber.toInt
      for ((token, result) <- transitions.as[JsObject].fields){
        table = table+((state, token)->getParserAction(result, stateNumber, token, rules))
      }
    }
    table
  }

  private def getParserAction(action : JsValue, state: String, token: String, rules: List[Rule]): ParserAction ={
    action.asOpt[JsArray] match {
      case Some(JsArray(JsString("shift") +: JsNumber(nextState) +: Nil)) => Shift(nextState.intValue())
      case Some(JsArray(JsString("reduce") +: JsNumber(ruleNum) +: Nil)) => Reduce(rules(ruleNum.intValue()))
      case Some(JsArray(JsString("done") +: Nil)) => new Done
      case _ => throw PALTableError(state, token)


    }
  }

  private def buildGotoTable(JSONGotoTable: JsObject): Map[(Int,String),Int] ={
    var table = new HashMap[(Int, String), Int]
    for ((stateNumber, transitions) <- JSONGotoTable.fields){
      val state = stateNumber.toInt
      for ((token, newState) <- transitions.as[JsObject].fields){
        newState match {
          case JsNumber(n) => table += ((state, token)-> n.intValue())
          case _ => throw PALGotoError(stateNumber, token)
        }
      }
    }
    table
  }
}
