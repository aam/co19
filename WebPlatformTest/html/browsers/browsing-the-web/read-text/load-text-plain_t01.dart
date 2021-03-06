/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html/browsers/browsing-the-web/read-text/load-text-plain.html
 * @assertion http://www.whatwg.org/html5/#read-text
 * @description Page load processing model for text files
 * @issue #18657
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "../../../../testcommon.dart";

void main() {
  IFrameElement iframe = new IFrameElement();
  document.body.append(iframe);
  
  void check(e) {
    print("onLoad called");
  
//    var doc = iframe.contentDocument;
    var doc = iframe.contentWindow.document;

    test(() {
      assert_equals(doc.compatMode, "BackCompat");
      assert_equals(doc.contentType, "text/plain");
      assert_equals(doc.doctype, null);
    }, "Checking document metadata for text file");
  
    test(() {
      assert_equals(doc.childNodes.length, 1, "Document should have 1 child");
      assert_equals(doc.documentElement.tagName, "HTML");
      assert_equals(doc.documentElement.childNodes.length, 2,
                  "Root element should have 2 children");
      assert_equals(doc.documentElement.firstChild.tagName, "HEAD");
      assert_equals(doc.documentElement.lastChild.tagName, "BODY");
      assert_equals(doc.documentElement.lastChild.childNodes.length, 1,
                  "Body element should have 1 child");
      assert_equals(doc.documentElement.lastChild.firstChild.tagName, "PRE");
    }, "Checking DOM for text file");
  
    test(() {
      assert_equals(doc.documentElement.lastChild.firstChild.firstChild.data,
                  "This is a sample text/plain document.\n\nThis is not an HTML document.\n\n");
    }, "Checking contents for text file");
    
    asyncEnd();
  }

  asyncStart();
//  iframe.onLoad.drain().then(check);
  iframe.onLoad.listen(check);
  
  
  iframe.src = // "../../../../common/text-plain.txt";
     "$testSuiteRoot/common/text-plain.txt";

}
