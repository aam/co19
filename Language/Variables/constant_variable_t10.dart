/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant variable is a variable whose declaration includes the 
 * modifier const. A constant variable is always implicitly final.
 * @description Checks that, if a new value is assigned to a constant liblary 
 * variable after it was initialized at declaration (even if this value is the 
 * same as the initializing one), this will cause a static warning and a 
 * runtime error throwing at execution.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

const x = 1;

main() {
  try {
    x = 1; /// static warning
    Expect.fail("Runtime error expected");
  } on Error catch (ok) {}
}
