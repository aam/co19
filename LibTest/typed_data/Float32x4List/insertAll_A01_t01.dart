/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void insertAll(int at, Iterable<E> iterable)
 * Inserts all elements of iterable at position [index] in the list.
 * This increases the length of the list by the length of iterable
 * and shifts all later elements towards the end of the list.
 * @description Checks that [UnsupportedError] is thrown
 * since [Float32x4List] is a fixed-size list.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

pack(v) => new Float32x4.splat(v);

main() {
  var l = new Float32x4List(10);
  try {
    l.insertAll(0, [pack(1.0), pack(2.0), pack(3.0)]);
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError catch(ok) {}
  Expect.equals(10, l.length);

  l = new Float32x4List(0);
  try {
    l.insertAll(0, [pack(1.0), pack(1.0), pack(1.0)]);
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError catch(ok) {}
  Expect.equals(0, l.length);
}
