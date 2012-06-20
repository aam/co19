/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The formal parameter list of a function introduces a new scope 
 * known as the function's formal parameter scope. The formal parameter scope 
 * of a function f is enclosed in the scope where f is declared.
 * The body of a function introduces a new scope known as the function's body
 * scope. The body of a function f is enclosed in the scope introduced by formal
 * parameter scope of f.
 * @description Trivially checks that the function scopes are indeed nested 
 * in the described manner.
 * @author rodionov
 */

final foo = 1;

main () {
  f(var foo) {
    Expect.equals(2, foo);
  }
  f(foo + 1);
  
  g([var foo = foo + 10]) {
    Expect.equals(11, foo);
  }
  g();
}
