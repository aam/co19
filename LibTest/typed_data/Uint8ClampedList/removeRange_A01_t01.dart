/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeRange(int start, int end)
 * Removes the elements in the range start to end exclusive.
 * Throws an UnsupportedError, and doesn't remove elements,
 * if the length of [this] cannot be changed.
 * @description Checks that [UnsupportedError] is thrown
 * since [Uint8ClampedList] is a fixed-size list.
 * @note undocumented
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

check(list) {
  var l = new Uint8ClampedList.fromList(list);
  var length = l.length;
  try {
    l.removeRange(0, 1);
    Expect.fail("This operation should not be supported");
  } on UnsupportedError catch(ok) {};
  Expect.equals(length, l.length);
}

main() {
  check([]);
  check([1]);
  check([1, 2, 3, 4, 5]);
}
