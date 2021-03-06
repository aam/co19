/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E removeFirst()
 * Removes and returns the first element of this queue.
 * @description Checks that exactly the first element is removed and returned.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  DoubleLinkedQueue list = new DoubleLinkedQueue();
  list.addLast(1);
  list.addLast("2");
  list.addLast(true);

  Expect.isTrue(list.length == 3);

  Expect.isTrue(list.removeFirst() == 1);
  Expect.isTrue(list.length == 2);
  Expect.isTrue(list.first == "2");

  Expect.isTrue(list.removeFirst() == "2");
  Expect.isTrue(list.length == 1);
  Expect.isTrue(list.first == true);

  Expect.isTrue(list.removeFirst() == true);
  Expect.isTrue(list.length == 0);

  Queue queue = new Queue();
  queue.addLast(1);
  queue.addLast(1);
  queue.addLast(1);

  Expect.isTrue(queue.length == 3);

  Expect.isTrue(queue.removeFirst() == 1);
  Expect.isTrue(queue.length == 2);
  Expect.isTrue(queue.first == 1);

  Expect.isTrue(queue.removeFirst() == 1);
  Expect.isTrue(queue.length == 1);
  Expect.isTrue(queue.first == 1);

  Expect.isTrue(queue.removeFirst() == 1);
  Expect.isTrue(queue.length == 0);
}
