/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws Error if argument is null.
 * @description Tries to call the method with null parameter.
 * @author msyabro
 * @reviewer varlax
 */
import "dart:collection";

main() {
  try {
    new Queue().addAll(null);
    Expect.fail("Error is expected");
  } on Error catch(e) {}
}