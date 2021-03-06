/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> skip(int count)
 * Skips the first count data events from this stream.
 * @description Checks that the first n elements are skipped.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(List data, int count) {
  Stream s = new Stream.fromIterable(data);
  Stream t = s.skip(count);
  int seen = 0;
  asyncStart();
  t.listen((value) {
      Expect.isTrue(seen + count < data.length, "seen=$seen, count=$count");
      Expect.equals(data[count + seen], value);
      seen++;
    },
    onDone: () {
      asyncEnd();
    }
  );
}

main() {
  check([], 0);
  check([], 1);
  check([], 10);
  check([null], 0);
  check([null], 1);
  check([null], 2);
  check([1, 2, 3], 0);
  check([1, 2, 3], 1);
  check([1, 2, 3], 2);
  check([1, 2, 3], 12);
  check([[], [[]], [[[]]]], 2);
}

