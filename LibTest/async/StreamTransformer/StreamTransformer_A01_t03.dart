/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory StreamTransformer(StreamSubscription<T>
 *   transformer(Stream<S> stream, bool cancelOnError))
 * Creates a StreamTransformer.
 *
 * The returned instance takes responsibility of implementing (bind). When
 * the user invokes bind it returns a new "bound" stream. Only when the user
 * starts listening to the bound stream, the listen method invokes the given
 * closure transformer.
 *
 * @description Checks that transformer is invoked when stream gets a
 * subscription.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/async_utils.dart";

main() {
  var s = new Stream.fromIterable([1]);
  var tr = new StreamTransformer((stream, cancelOnError) {
    asyncEnd();
    return stream.listen(null);
  });

  asyncStart();
  s.transform(tr).toList();
}
