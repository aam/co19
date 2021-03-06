/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures various WebGL functions fail when passed non
 * OpenGL ES 2.0 enums.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "resources/desktop-gl-constants.dart";
import "../../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <canvas id="canvas" width="2" height="2"> </canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug("Canvas.getContext");

  var gl = create3DContext(document.getElementById("canvas"));
  if (gl == null) {
    testFailed("context does not exist");
  } else {
    testPassed("context exists");

    debug("Checking gl enums.");

    var buffer = new Uint8List(2);
    var buf = new Uint16List.view(buffer.buffer);
    var tex = gl.createTexture();
    gl.bindBuffer(wgl.ARRAY_BUFFER, gl.createBuffer());
    glErrorShouldBe(gl, wgl.NO_ERROR);

    var tests = [
      () => gl.bindTexture(desktopGL['TEXTURE_3D'], tex),
      () => gl.blendEquation(desktopGL['MIN']),
      () => gl.blendEquation(desktopGL['MAX']),
      () => gl.blendEquationSeparate(desktopGL['MIN'], wgl.FUNC_ADD),
      () => gl.blendEquationSeparate(desktopGL['MAX'], wgl.FUNC_ADD),
      () => gl.blendEquationSeparate(wgl.FUNC_ADD, desktopGL['MIN']),
      () => gl.blendEquationSeparate(wgl.FUNC_ADD, desktopGL['MAX']),
      () => gl.bufferData(wgl.ARRAY_BUFFER, 3, desktopGL['STATIC_READ']),
      () => gl.disable(desktopGL['CLIP_PLANE0']),
      () => gl.disable(desktopGL['POINT_SPRITE']),
      () => gl.getBufferParameter(wgl.ARRAY_BUFFER, desktopGL['PIXEL_PACK_BUFFER']),
      () => gl.hint(desktopGL['PERSPECTIVE_CORRECTION_HINT'], wgl.FASTEST),
      () => gl.isEnabled(desktopGL['CLIP_PLANE0']),
      () => gl.isEnabled(desktopGL['POINT_SPRITE']),
      //() => gl.pixelStorei(desktopGL['PACK_SWAP_BYTES'], 1),
      () => gl.readPixels(0, 0, 1, 1, wgl.ALPHA, wgl.SHORT, buf),
    ];
    for (var ii = 0; ii < tests.length; ++ii) {
      tests[ii]();
      glErrorShouldBe(gl, wgl.INVALID_ENUM, "test #$ii should return INVALID_ENUM.");
    }

    gl.bindTexture(wgl.TEXTURE_2D, tex);
    glErrorShouldBe(gl, wgl.NO_ERROR);

    tests = [
      () => gl.getTexParameter(wgl.TEXTURE_2D, desktopGL['GENERATE_MIPMAP']),
      () => gl.texParameteri(desktopGL['TEXTURE_3D'], wgl.TEXTURE_MAG_FILTER, wgl.NEAREST),
      () => gl.texParameteri(wgl.TEXTURE_2D, desktopGL['GENERATE_MIPMAP'], 1)
    ];
    for (var ii = 0; ii < tests.length; ++ii) {
      tests[ii]();
      glErrorShouldBe(gl, wgl.INVALID_ENUM, "test2 #$ii should return INVALID_ENUM.");
    }
  }
}
