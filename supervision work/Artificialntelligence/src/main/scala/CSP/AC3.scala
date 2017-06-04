package CSP


import scala.collection.immutable.Queue

/**
  * Created by Al on 12/05/2017.
  */
object AC3 {
  def main(args: Array[String]): Unit = {
    val domain = List(new Red, new Cyan, new Black)
    val v1 = new Variable(domain, "1")
    val v2 = new Variable(domain, "2")
    val v3 = new Variable(domain, "3")
    val v4 = new Variable(domain, "4")
    val v5 = new Variable(domain, "5")
    val v6 = new Variable(domain, "6")
    val v7 = new Variable(domain, "7")
    val v8 = new Variable(domain, "8")

    val problemVariables = List(  v1, v2, v3, v4, v5, v6, v7, v8)

    val arcs = List(
      new Arc(v1, v2),
      new Arc(v1, v3),
      new Arc(v1, v4),
      new Arc(v2, v4),
      new Arc(v2, v6),
      new Arc(v3, v4),
      new Arc(v3, v7),
      new Arc(v4, v5),
      new Arc(v5, v6),
      new Arc(v5, v7),
      new Arc(v6, v7),
      new Arc(v6, v8),
      new Arc(v7, v8),

      // Reverse arcs

      new Arc(v2, v1),
      new Arc(v3, v1),
      new Arc(v4, v1),
      new Arc(v4, v2),
      new Arc(v6, v2),
      new Arc(v4, v3),
      new Arc(v7, v3),
      new Arc(v5, v4),
      new Arc(v6, v5),
      new Arc(v7, v5),
      new Arc(v7, v6),
      new Arc(v8, v6),
      new Arc(v8, v7)
    )

    populateNeighbours(problemVariables, arcs)
    println("Populated neighbours" + problemVariables)
    propagateConstraints(problemVariables, arcs)
    println("Removed preliminary consistency issues " + problemVariables)

    v1.domain = List(new Red) // Do steps

    propagateConstraints(problemVariables, arcs)
    println("V1 = CSP.Red " + problemVariables)

    v4.domain = List(new Cyan)

    propagateConstraints(problemVariables, arcs)
    println("V4 = CSP.Cyan " + problemVariables)

    v5.domain = List(new Red)

    propagateConstraints(problemVariables, arcs)
    println("V5 = CSP.Red " + problemVariables)

    v8.domain = List(new Cyan)

    propagateConstraints(problemVariables, arcs)
    println("V8 = CSP.Cyan " + problemVariables)

    v6.domain = List(new Black)
  }

  private def propagateConstraints(variables: List[Variable], arcs: List[Arc]) = {
    var toCheck: Queue[Arc] = Queue()
    toCheck = toCheck.enqueue(arcs)
    while (toCheck.nonEmpty){
      val (arc: Arc, rest) = (toCheck.front, toCheck.tail)
      toCheck = rest
      val (i, j) = (arc.v1, arc.v2)
      if (removeInconsistencies(i, j)){
        for(k <- i.neighbours){
          toCheck = toCheck enqueue new Arc(k, i)
        }
      }
    }
  }

  private def removeInconsistencies(v1: Variable, v2: Variable): Boolean = {
    var result = false
    var newDomain: List[Colour] = Nil
    for (d <- v1.domain) {
      if(anyCompatible(d, v2.domain)){
        newDomain = d :: newDomain
      } else {
        result = true
        println("Removing inconsistency: "+ d + " from " + v1.name)
      }
    }
    v1.domain = newDomain
    result
  }

  private def anyCompatible(c: Colour, domain: List[Colour]): Boolean ={
    domain match {
      case Nil => false
      case (c1 :: rest) => compatible(c, c1) || anyCompatible(c, rest)
    }
  }

  private def compatible(c1: Colour, c2: Colour): Boolean = {
    c1 match {
      case Cyan() =>
        c2 match {
        case Cyan() => false
        case _ => true
      }
      case Red() =>
        c2 match {
          case Red() => false
          case _ => true
        }
      case Black() =>
        c2 match {
          case Black() => false
          case _ => true
        }
    }
  }

  private def populateNeighbours(vars: List[Variable], arcs: List[Arc]): Unit = {
    for (a <- arcs) {
      a.v1.neighbours = add(a.v2, a.v1.neighbours)
      a.v2.neighbours = add(a.v1, a.v2.neighbours)
    }
  }

  private def add(v: Variable, set: List[Variable]): List[Variable] = {
    if (set.contains(v)) {
      set
    } else {
      v :: set
    }
  }
}
