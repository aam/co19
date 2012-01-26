/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates an empty set
 * @description Checks that an empty set is created.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */


main() {
  Set s = new Set();
  Expect.isTrue(s is Set);
  Expect.isTrue(s.isEmpty());
}