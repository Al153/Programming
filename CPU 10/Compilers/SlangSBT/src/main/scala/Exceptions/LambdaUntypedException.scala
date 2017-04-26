package Exceptions

import sun.awt.CausedFocusEvent.Cause

/**
  * Created by Al on 24/04/2017.
  */
class LambdaUntypedException(cause: Throwable = null) extends Exception("getArgType was called on a lambda function before its type had been evaluated", cause) {}
