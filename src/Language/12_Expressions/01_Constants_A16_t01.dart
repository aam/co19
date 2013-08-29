/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if evaluation of a compile-time constant would raise
 * an exception.
 * @description Checks that an IntegerDivisionByZeroException raised during evaluation 
 * of a compile-time constant causes a compile-time error.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 * @issue 5775, 8360
 */

final m = 1 % 0;

main() {
  try {
    print(m);
  } catch (anything) {}
}