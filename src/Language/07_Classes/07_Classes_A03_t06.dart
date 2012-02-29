/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * abstract? class identifier typeParameters? superclass? interfaces?
 *   '{' classMemberDefinition* '}'
 * ;
 * classMemberDefinition:
 *   declaration ';' |
 *   methodSignature functionBody
 * ;
 * methodSignature:
 *   factoryConstructorSignature
 *   | static? functionSignature
 *   | getterSignature
 *   | setterSignature
 *   | operatorSignature
 *   | constructorSignature initializers?
 * ;
 * @description Checks that it is a compile-time error if an operator
 * definition does not include a body.
 * @reviewer rodionov
 * @compile-error
 * @author msyabro
 */

class A {
  operator==(A other);
}

main() {
  try {
    A a = new A();
  } catch(var e) {}
}