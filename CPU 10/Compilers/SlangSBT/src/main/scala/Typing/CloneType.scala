package Typing

import scala.collection.immutable.HashMap

/**
  * Created by Al on 16/06/2017.
  * Type cloning rules:

  ** terminology **
  bound - two type instances are bound if they share the same syntactic structure and share the same variables in each place
		if 'a, 'b are bound instances of the same type, then unifying 'a = 'c also yields 'b = 'c

	cloned - two type instances are cloned if they share the same structure but with different type variable instances
		if 'a, 'b are cloned instances, then unifying 'a = 'c leaves 'b alone

	if 'a, 'b are cloned and contain no type variables, then they are also bound

  ** Examples **

let
	fun f(x) = x + x; - x's type should not be cloned and hence due to the + operator, is unified to int. f: int -> int
	fun id(x) = x; - x's type should not be cloned so represents same variable. id: 'a -> 'a
	fun pair(x) = (x,x); - x's type not cloned, so pair: 'a -> 'a * 'a
	val foo = fun (y) -> inl (unit) inl (unit) y end; - y not cloned, instances the same. foo: 'a -> unit + (unit + 'a)
	fun rec(x) = if (x = 0) then 0 else x + (rec(x-1)); - rec's type should not be cloned
in
	letS
		val res1 = (pair pair); - res1: ('a -> ('a * 'a)) * ('a -> ('a * 'a)), since pair's type is cloned
		val res2 = (id id) 1;  - id cloned here
		fun occurs(f) = f f;  - should fail occurs check, since f's type instances are bound
		fun bar (x) = (id (fst x), id (snd x)); - id is cloned so bar: ('a * 'b -> ('a * 'b)) and id is used as 'a -> 'a and 'b -> 'b
	in
		()
	end;
end;

  ** rules **

fun (X) -> e end ; 			:: x's type not cloned in e (simple lambda)
let fun f(x) = e1 in e2; 	:: f and x's types are bound in e1, but f's type is cloned in e2
let val x = e1 in e2; 		:: x is a free variable in e1, and is cloned in e2
case e1 of 					:: x and y are bound in e2, e3
	inl(x) -> e2
	| inr(y) -> e3
end

the issue is our CST -> AST translator makes
	let val x = e1 in e2;
become
	SLetVal(x, , e1, e2)

the implicit lambda is not bound (ie x is cloned in e2)


	let fun f(x) = e1 in e2;
becomes
	SLET_REC f (LAMBDA(x,e1)) e2

so the lambda is bound, f is not bound in e2

	fun (x) -> e end;
becomes
	LAMBDA(x,e)

this is a bound lambda

	case e1 of
		inl(x) -> e2
		| inr(y) -> e3
	end

becomes
	CASE(e1, LAMBDA(x,e2), LAMBDA(y,e3))

with bound lambdas

Hence SLambdas are bound, SLetVals are not
  */


object CloneType {
  def apply(t: Type): Type = {
    val cloneMap = new HashMap[Int, Type]
    val (res, _) = doClone(t.prune, cloneMap)
    res
  }

  def doClone(t: Type, m: HashMap[Int, Type]): (Type, HashMap[Int, Type]) ={
    t match {
      case TSimple(s) => (TSimple(s),m)
      case TFn(t1, t2) =>
        val (c1, m1) = doClone(t1, m)
        val (c2, m2) = doClone(t2, m1)
        (TFn(c1,c2), m2)
      case TProduct(t1, t2) =>
        val (c1, m1) = doClone(t1, m)
        val (c2, m2) = doClone(t2, m1)
        (TProduct(c1,c2), m2)
      case TRef(t1) =>
        val (c1, m1) = doClone(t1, m)
        (TRef(c1), m1)
      case TSum(t1, t2) =>
        val (c1, m1) = doClone(t1, m)
        val (c2, m2) = doClone(t2, m1)
        (TSum(c1,c2), m2)
      case TVariable(id) => // since this is pruned, we do not need to check for
            m.get(id) match {
              case Some(v) => (v, m)
              case None =>
                val v = newTypeParameter.newVar()
                (v, m + (id -> v))
            }
    }
  }
}
