/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32List.view(ByteBuffer buffer, [int byteOffset = 0, int length])
 * Creates an [Float32List] _view_ of the specified region in
 * the specified byte buffer.
 * @description Checks that an instance of Float32List is created.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(array, offset, length) {
  var tmp = new Float32List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Float32List.view(byteBuffer, offset, length);
  Expect.isTrue(l is Float32List);
}

main() {
  check([],0,0);
  check([3.4028234663852886e38, 1.401298464324817e-45, 1.1754943508222875e-38], 0, 3);
  check([1000.0, 1000.0, 1000.0], 0, 3);
  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0], 0, 18);
  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0], 10, 13);
  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0], 34, 1);
}
