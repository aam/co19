/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verify texImage2D and texSubImage2D code paths taking canvas
 * elements
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "resources/tex-image-and-sub-image-2d-with-canvas.dart";
import "../../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="32px" height="32px"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  testPrologue(gl) {
    return true;
  }

  generateTest(wgl.RGBA, wgl.UNSIGNED_SHORT_5_5_5_1, testPrologue)();
}
