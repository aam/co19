/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String name
 * read-only
 * Name of the invalid argument, if available.
 * @description Checks that name property returns invalid argument name if
 * available
 * @author sgrekhov@unipro.ru
 */

import "../../../Utils/expect.dart";
 
main() {
  var name = "some name";
  ArgumentError err = new ArgumentError.notNull(name);
  Expect.equals(name, err.name);
}
