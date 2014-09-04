/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test URL segmentation.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";
import "resources/utilities.dart";

// Format: [URL, [SCHEME, HOST, PORT, PATH, QUERY, REF]]
List cases = [ 
  ["http://user:pass@foo:21/bar;par?b#c",    ["http:","foo","21","/bar;par","?b","#c"]],
  ["http:foo.com",                           ["http:","example.org","","/foo/foo.com","",""]],
  ["\\t   :foo.com   \\n",                   ["http:","example.org","","/foo/:foo.com","",""]],
  [" foo.com  ",                             ["http:","example.org","","/foo/foo.com","",""]],
  ["a:\\t foo.com",                          ["a:","",""," foo.com","",""]],
  ["http://f:21/ b ? d # e ",                ["http:","f","21","/%20b%20","?%20d%20","# e"]],
  ["http://f:/c",                            ["http:","f","","/c","",""]],
  ["http://f:0/c",                           ["http:","f","0","/c","",""]],
  ["http://f:00000000000000/c",              ["http:","f","0","/c","",""]],
  ["http://f:00000000000000000000080/c",     ["http:","f","0","/c","",""]],
  ["http://f:b/c",                           [":","","","","",""]],
  ["http://f: /c",                           [":","","","","",""]],
  ["http://f:\\n/c",                         [":","","","","",""]],
  ["http://f:fifty-two/c",                   [":","","","","",""]],
  ["http://f:999999/c",                      [":","","0","","",""]],
  ["http://f: 21 / b ? d # e ",              [":","","","","",""]],
  ["",                                       ["http:","example.org","","/foo/bar","",""]],
  ["  \\t",                                  ["http:","example.org","","/foo/bar","",""]],
  [":foo.com/",                              ["http:","example.org","","/foo/:foo.com/","",""]],
  [":foo.com\\\\",                           ["http:","example.org","","/foo/:foo.com/","",""]],
  [":",                                      ["http:","example.org","","/foo/:","",""]],
  [":a",                                     ["http:","example.org","","/foo/:a","",""]],
  [":/",                                     ["http:","example.org","","/foo/:/","",""]],
  [":\\\\",                                  ["http:","example.org","","/foo/:/","",""]],
  [":#",                                     ["http:","example.org","","/foo/:","",""]],
  ["#",                                      ["http:","example.org","","/foo/bar","",""]],
  ["#/",                                     ["http:","example.org","","/foo/bar","","#/"]],
  ["#\\\\",                                  ["http:","example.org","","/foo/bar","","#\\\\"]],
  ["#;?",                                    ["http:","example.org","","/foo/bar","","#;?"]],
  ["?",                                      ["http:","example.org","","/foo/bar","",""]],
  ["/",                                      ["http:","example.org","","/","",""]],
  [":23",                                    ["http:","example.org","","/foo/:23","",""]],
  ["/:23",                                   ["http:","example.org","","/:23","",""]],
  ["//",                                     [":","","","","",""]],
  ["::",                                     ["http:","example.org","","/foo/::","",""]],
  ["::23",                                   ["http:","example.org","","/foo/::23","",""]],
  ["foo://",                                 ["foo:","","","//","",""]],
  ["http://a:b@c:29/d",                      ["http:","c","29","/d","",""]],
  ["http::@c:29",                            ["http:","example.org","","/foo/:@c:29","",""]],
  ["http://&a:foo(b]c@d:2/",                 ["http:","d","2","/","",""]],
  ["http://::@c@d:2",                        ["http:","d","2","/","",""]],
  ["http://foo.com:b@d/",                    ["http:","d","","/","",""]],
  ["http://foo.com/\\\\@",                   ["http:","foo.com","","//@","",""]],
  ["http:\\\\\\\\foo.com\\\\",               ["http:","foo.com","","/","",""]],
  ["http:\\\\\\\\a\\\\b:c\\\\d@foo.com\\\\", ["http:","a","","/b:c/d@foo.com/","",""]],
  ["foo:/",                                  ["foo:","","","/","",""]],
  ["foo:/bar.com/",                          ["foo:","","","/bar.com/","",""]],
  ["foo://///////",                          ["foo:","","","/////////","",""]],
  ["foo://///////bar.com/",                  ["foo:","","","/////////bar.com/","",""]],
  ["foo:////://///",                         ["foo:","","","////://///","",""]],
  ["c:/foo",                                 ["c:","","","/foo","",""]],
  ["//foo/bar",                              ["http:","foo","","/bar","",""]],
  ["http://foo/path;a??e#f#g",               ["http:","foo","","/path;a","??e","#f#g"]],
  ["http://foo/abcd?efgh?ijkl",              ["http:","foo","","/abcd","?efgh?ijkl",""]],
  ["http://foo/abcd#foo?bar",                ["http:","foo","","/abcd","","#foo?bar"]],
  ["[61:24:74]:98",                          ["http:","example.org","","/foo/[61:24:74]:98","",""]],
  ["http://[61:27]:98",                      [":","","0","","",""]],
  ["http:[61:27]/:foo",                      ["http:","example.org","","/foo/[61:27]/:foo","",""]],
  ["http://[1::2]:3:4",                      [":","","","","",""]],
  ["http://2001::1",                         [":","","","","",""]],
  ["http://[2001::1",                        [":","","","","",""]],
  ["http://2001::1]",                        [":","","","","",""]],
  ["http://2001::1]:80",                     [":","","","","",""]],
  ["http://[2001::1]",                       ["http:","[2001::1]","","/","",""]],
  ["http://[2001::1]:80",                    ["http:","[2001::1]","","/","",""]],
  ["http://[[::]]",                          [":","","","","",""]],
  ["http:/example.com/",                     ["http:","example.org","","/example.com/","",""]],
  ["ftp:/example.com/",                      ["ftp:","example.com","","/","",""]],
  ["https:/example.com/",                    ["https:","example.com","","/","",""]],
  ["madeupscheme:/example.com/",             ["madeupscheme:","","","/example.com/","",""]],
  ["file:/example.com/",                     ["file:","","","/example.com/","",""]],
  ["ftps:/example.com/",                     ["ftps:","","","/example.com/","",""]],
  ["gopher:/example.com/",                   ["gopher:","example.com","","/","",""]],
  ["ws:/example.com/",                       ["ws:","example.com","","/","",""]],
  ["wss:/example.com/",                      ["wss:","example.com","","/","",""]],
  ["data:/example.com/",                     ["data:","","","/example.com/","",""]],
  ["javascript:/example.com/",               ["javascript:","","","/example.com/","",""]],
  ["mailto:/example.com/",                   ["mailto:","","","/example.com/","",""]],
  ["http:example.com/",                      ["http:","example.org","","/foo/example.com/","",""]],
  ["ftp:example.com/",                       ["ftp:","example.com","","/","",""]],
  ["https:example.com/",                     ["https:","example.com","","/","",""]],
  ["madeupscheme:example.com/",              ["madeupscheme:","","","example.com/","",""]],
  ["file:example.com/",                      ["file:","","","/example.com/","",""]],
  ["ftps:example.com/",                      ["ftps:","","","example.com/","",""]],
  ["gopher:example.com/",                    ["gopher:","example.com","","/","",""]],
  ["ws:example.com/",                        ["ws:","example.com","","/","",""]],
  ["wss:example.com/",                       ["wss:","example.com","","/","",""]],
  ["data:example.com/",                      ["data:","","","example.com/","",""]],
  ["javascript:example.com/",                ["javascript:","","","example.com/","",""]],
  ["mailto:example.com/",                    ["mailto:","","","example.com/","",""]],

  ["/a/b/c",                                  ["http:","example.org","","/a/b/c","",""]],
  ["/a/ /c",                                  ["http:","example.org","","/a/%20/c","",""]],
  ["/a%2fc",                                  ["http:","example.org","","/a%2fc","",""]],
  ["/a/%2f/c",                                ["http:","example.org","","/a/%2f/c","",""]],

  ["#\u03B2",                                 ["http:","example.org","","/foo/bar","","#\u03B2"]],
];

void doTest(int i) {
  String url = cases[i][0];
  List expected = cases[i][1];
  test((){
/*
    Expect.listEquals(
      expected,
      segments(url)
    );
*/    
    Expect.equals(
      expected.toString(),
      segments(url).toString()
    );
    }, ' $i ["$url"]');
}

void main() {
  var originalBaseURL = canonicalize(".");
  setBaseURL("http://example.org/foo/bar");
  for (var i = 0; i < cases.length; ++i) {
    doTest(i);
  }
  checkTestFailures();
  setBaseURL(originalBaseURL);
}

