/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Iterator<E> iterator
 * Returns an [Iterator] that iterates over this [Iterable] object.
 * @description Checks that [iterator] is final and can't be set.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int8List.fromList([0]);
  try {
    l.iterator = l.iterator;
    Expect.fail("[iterator] should be final");
  } on NoSuchMethodError catch(ok) {}
}
