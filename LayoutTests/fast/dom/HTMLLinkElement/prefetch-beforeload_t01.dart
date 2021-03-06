/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests if link prefetches are enabled
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <link href="$root/prefetch.link" rel="prefetch"/>
    ''', treeSanitizer: new NullTreeSanitizer());

  var link = document.body.querySelector('link');

  link.addEventListener('beforeload', (_) {
    return false;
  });

  link.onLoad.listen((_) => testFailed('onload'));
  link.onError.listen((_) => testFailed('onerror'));
}
