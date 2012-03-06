/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An additive expression of the form e1 op e2 is equivalent
 * to the method invocation e1.op(e2).
 * @description Checks that an expression of the form e1 + e2 is
 * equivalent to the method invocation e1.operator+(e2).
 * @author kaigorodov
 */

int counter=0;

class A {
  final int value;
  const A(var v):value=v;
  operator+(var v) {
    counter+=1;
    return new A(value+v);
  }
  operator-(var v) {
    counter+=2;
    return new A(v-value);
  }
}

main() {
  A a = new A(2);
  a + 3;
  a - 2;
  Expect.equals(3, counter);
}