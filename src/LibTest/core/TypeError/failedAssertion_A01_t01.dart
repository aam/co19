/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that [failedAssertion] is recorded correctly.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview Undocumented
 */

#import("../../../Utils/dynamic_check.dart");

main() {
  if(isCheckedMode()) {
    try {
      int x = true;
      Expect.fail("TypeError expected");
    } catch (TypeError e) {
      Expect.equals(@"$expr instanceof int", e.failedAssertion);
    }

    try {
      bool x = 1;
      Expect.fail("TypeError expected");
    } catch (TypeError e) {
      Expect.equals(@"$expr instanceof bool", e.failedAssertion);
    }

    try {
      String x = 1;
      Expect.fail("TypeError expected");
    } catch (TypeError e) {
      Expect.equals(@"$expr instanceof String", e.failedAssertion);
    }
  }
}