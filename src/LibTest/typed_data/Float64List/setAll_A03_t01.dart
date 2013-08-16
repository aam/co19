/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * It is an error if the [iterable] is longer than length - [index].
 * @description Checks that an error is thrown if
 * the [iterable] is longer than length - index.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";


main() {
  var l = new Float64List.fromList([]);
  try {
    l.setAll(0, [1.0]);
    Expect.fail("Error is expected");
  } catch(ok) {}

  l = new Float64List.fromList([1.0, 2.0, 3.0]);
  try {
    l.setAll(0, [1.0, 2.0, 3.0, 4.0]);
    Expect.fail("Error is expected");
  } catch(ok) {}

  l = new Float64List.fromList([1.0, 2.0, 3.0]);
  try {
    l.setAll(1, [1.0, 2.0, 3.0]);
    Expect.fail("Error is expected");
  } catch(ok) {}

  l = new Float64List.fromList([1.0, 2.0, 3.0]);
  try {
    l.setAll(2, [1.0, 2.0]);
    Expect.fail("Error is expected");
  } catch(ok) {}
}

