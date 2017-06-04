package Search

/**
  * Created by Al on 28/05/2017.
  */
object RecursiveBestFirstSearch {
    def lt(n1: Node, n2: Node): Boolean = n1.F_N < n2.F_N

    def search(isGoal: Node => Boolean)(n: Node, d: Int, F_N: Int, bound: Int): Either[Node, Int] = {
      if (F_N > bound) Right(F_N)
      else if (isGoal(n))
        Left(n)
      else if (n.children().length == 0) Right(Int.MaxValue)
      else {
        for ( nk <- n.children()){
          val f_n = d+nk.pathLength+nk.h(nk.id)
          if (f_n < F_N) {
            nk.F_N = Integer.max(F_N, nk.F_N)
          } else {
            nk.F_N = d+nk.pathLength+nk.h(nk.id)
          }
        }

        var sortedKids = n.children().sortWith(lt _ )
        while (sortedKids(0).F_N <= bound && sortedKids(0).F_N < Int.MaxValue){
          val bound1 = Integer.min(bound, sortedKids(1).F_N)
          sortedKids(0).F_N = NewF()
        }

      }
    }
}


sealed trait EitherOr[N,M] {}
case class Success[N](v: N) extends  EitherOr[N, _] {}
case class Try[M](v: M) extends  EitherOr[_, M]{}

