/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart source text is represented as a sequence of Unicode code
 * points.
 * @description Checks that unicode escape sequences cause compile errors when
 * used outside of string literals.
 * @compile-error
 * @author hlodvig
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  var \u0041 = 1;
  Expect.equals(1, \u0041);
}
