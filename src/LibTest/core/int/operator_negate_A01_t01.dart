/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The unary '-' operator. 
 * @description Checks that this operator returns correct value.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */

main() {
  Expect.equals(0, 0.negate());
  Expect.equals(0, 0.negate().negate());
  Expect.equals(-1, 1.negate());
  Expect.equals(1, (-1).negate());
  Expect.equals(-10, 10.negate());
  Expect.equals(-2147483647, 2147483647.negate());
  Expect.equals(-4294967295, 4294967295.negate());
  Expect.equals(-9223372036854775807, 9223372036854775807.negate());
  Expect.equals(9223372036854775807, (-9223372036854775807).negate());
  Expect.equals(-147808829414345923316083210206383297601, 147808829414345923316083210206383297601.negate());
  
  // -(-x) = x
  for(int i = 0; i <= 1000; i++) {
    int num = 1 << i;
    Expect.equals(num, num.negate().negate());
    num = -1 << i;
    Expect.equals(num, num.negate().negate());
  }
}