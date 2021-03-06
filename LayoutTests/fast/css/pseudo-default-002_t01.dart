/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test performs a check for the :default CSS selector on
 * multiple submit buttons.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
       input { background: red; }
       button { background: red; }
       :default { background: lime; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="description"></p>
      <form method="get">
      <input name="victim" type="submit" value="Submit" />
      <input name="victim" type="submit" value="Submit"/>
      <button name="victim" type="submit"/>Submit</button>
      </form>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByName("victim");
  shouldBe(getComputedStyle(v[0], null).getPropertyValue('background-color'), 'rgb(0, 255, 0)');
  for (var i = 1; i < v.length; i++)
    shouldBe(getComputedStyle(v[i], null).getPropertyValue('background-color'), 'rgb(255, 0, 0)');
}
