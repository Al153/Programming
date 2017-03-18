package Parsing
import Parsing.DFA.{DFA, DFAState}
import Exceptions.{PALConfigException, PALLexerStartError}
import play.api.libs.json._

import scala.collection.immutable.HashMap

/**
  * Created by Al on 12/03/2017.
  */
class LexerConfiguration(configuration :JsObject, ruleNames:List[String]) {
  private val dfas: Map[String, DFA] = buildDFAs(configuration, ruleNames, new HashMap[String,DFA]())

  def getDFAs: Map[String, DFA] = dfas

  private def buildDFAs(JSONdfas: JsObject, rules:List[String], table:Map[String, DFA]):Map[String,DFA] = {
    rules match {
      case Nil => table
      case name :: rest =>
        val dfaEntry = JSONdfas\name
        val startState = dfaEntry\"start"
        val dfaStates = dfaEntry\"states" match {
          case JsDefined(value) => value
          case _ : JsUndefined => throw PALConfigException(List("Lexer","dfas",name,"states"))
        }

        val acceptingStates:JsArray = dfaEntry\"accept" match {
          case  _ : JsUndefined => throw PALConfigException(List("Lexer" , "dfas" , name , "accept"))
          case JsDefined(value :JsArray) => value
        }


        startState match {
          case _:JsUndefined => throw new PALLexerStartError(name)
          case JsDefined(JsString(n)) =>
            val newDFA = buildDFA(dfaStates.as[JsObject], n, acceptingStates)
            buildDFAs(JSONdfas, rest, table + (name -> newDFA))
        }
    }
  }

  private def buildDFA(dfaStates: JsObject, start: String, acceptingStates :JsArray) : DFA = {

    // build a list of state names as strings
    val stateNames = dfaStates.keys
    // Build a map of string state to int state
    var stringToInt = new HashMap[String, Int]
    var i = 0
    for (key <- stateNames) {
      stringToInt += (key -> i)
      i += 1
    }

    // use that to translate start to an int
    val startState = stringToInt(start)
    var states = new HashMap[Int, DFAState]()
    for ((name, transitions) <- dfaStates.fields){
      states += (stringToInt(name) -> buildDFAState(transitions.as[JsObject], stringToInt, name))
    }

    acceptingStates match {
      case JsArray(elements) =>
        for (i <- elements){
          i match {
            case JsString(name) =>
              states(stringToInt(name)).setAccept(true)
          }
        }
        new DFA(states, startState)
    }



  }

  private def buildDFAState(transitions: JsObject, stringToInt: Map[String,Int], name: String):DFAState ={
    var transitionsTable = new HashMap[Char,Int]
    for ((stringKey, newState) <- transitions.fields){
      val charKey = stringKey.charAt(0)
      newState match {
        case JsString(stateString) => transitionsTable += (charKey -> stringToInt(stateString))
      }
    }
    new DFAState(stringToInt(name), transitionsTable, false)
  }
}
