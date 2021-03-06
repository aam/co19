/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.periodic(Duration period,
 *     [T computation(int computationCount)])
 * The event values are computed by invoking computation.
 * @description Checks that event values are computed by invoking computation.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(int periodMs) {
  Stream s = new Stream.periodic(durationMs(periodMs),
      (computationCount) => periodMs);
  asyncStart();
  StreamSubscription<int> subs;
  subs = s.listen((data) {
    subs.cancel();
    Expect.equals(periodMs, data, "check($periodMs): data=$data");
    asyncEnd();
  });
}

main() {
  check(0);
  check(1);
  check(10);
  check(30);
  check(-10);
}
