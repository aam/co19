/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int offsetInBytes
 * Returns the offset in bytes into the underlying byte buffer of this view.
 * @description Checks that the returned offset is correct.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

check(array, offset, length) {
  var tmp = new Uint8List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Uint8List.view(byteBuffer, offset, length);
  Expect.equals(offset, l.offsetInBytes);
}

main() {
  check([], 0, 0);
  check([1], 0, 1);
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 0, 1);
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 9, 1);
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 5, 5);

}
