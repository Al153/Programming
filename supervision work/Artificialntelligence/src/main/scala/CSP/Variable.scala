package CSP

/**
  * Created by Al on 12/05/2017.
  */
class Variable(var domain: List[Colour], var name: String) {

  override def toString: String = {
    name + " -> " + domain.toString()
  }


  var neighbours: List[Variable] = Nil

}
