package Search

/**
  * Created by Al on 28/05/2017.
  */
class Node(val id: Int, val h: Int => Int, val children: Unit => Array[Node], val pathLength: Int) {
  var F_N: Int = Int.MinValue // stores heuristic value
}


