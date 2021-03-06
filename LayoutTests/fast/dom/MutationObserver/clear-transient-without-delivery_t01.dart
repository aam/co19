/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Transient registrations should be cleared even without delivery.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  var mutationsDelivered = false;
  function callback(mutations, observer) {
    mutationsDelivered = true;
  }
  var observer = new MutationObserver(callback);

  var div = document.createElement('div');
  var span = div.append(document.createElement('span'));
  observer.observe(div, attributes: true, subtree: true);
  span.remove();
  asyncStart();
  setTimeout(() {
    // By the time this function runs the transient registration should be cleared,
    // so we expect not to be notified of this attribute mutation.
    span.setAttribute('bar', 'baz');
    setTimeout(() {
      shouldBeFalse(mutationsDelivered);
      asyncEnd();
    }, 0);
  }, 0);
}
