/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void completeError(Object exception, [Object stackTrace])
 * StateError is thrown if a future is already completed.
 * @description Checks that an StateError is thrown if
 * the completer is already completed with a value.
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview undocumented
 */

import "dart:async";

main() {
  var completer = new Completer();
  completer.complete('value');

  try {
    completer.completeError('another value');
    Expect.fail('StateError is expected');
  } on StateError catch(e) {}
}