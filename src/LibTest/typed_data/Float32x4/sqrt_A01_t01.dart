/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4 sqrt()
 * Returns the square root of this.
 * @description Checks that the returned value contains square
 * roots of corresponding lanes of [this].
 * @author msyabro
 */

import "dart:typed_data";
import "dart:math";
import "../../../Utils/expect.dart";

check(x, y, z, w) {
  var obj = new Float32x4(x,y,z,w);
  var res = obj.sqrt();
  Expect.approxEquals(sqrt(obj.x), res.x, (res.x/1e7).abs());
  Expect.approxEquals(sqrt(obj.y), res.y, (res.y/1e7).abs());
  Expect.approxEquals(sqrt(obj.z),res.z, (res.z/1e7).abs());
  Expect.approxEquals(sqrt(obj.w), res.w, (res.w/1e7).abs());
}

main() {
  check(1.0, 1.0, 1.0, 1.0);
  check(4.0, 4.0, 4.0, 4.0);
  check(0.16, 0.25, 0.04, 1e-2);
  check(1e-10, 2.43e-14, 0.23e3, 9.31e18);
}