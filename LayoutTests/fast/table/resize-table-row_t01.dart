/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL1 = r'''
<style>
    td
    {
        width: 50px;
    }
    tr
    {
        height: 40px;
    }
    table.small tr
    {
        height: 20px;
    }

    table tr.filler
    {
        height: auto;
    }
</style>
''';

const String htmlEL2 = r'''
<div style="height: 300px">
    <table border="1" style="height: 100%">
        <tr id="firstRow"><td></td></tr>
        <tr class="filler"><td></td></tr>
    </table>
</div>
''';

bool smallRows = false;

void toggleSmallRows() {
    var table = document.querySelector("table");
    smallRows = !smallRows;
    if (smallRows)
        table.classes.add("small");
    else
        table.classes.remove("small");
}

void main() {
    description("Regression(99212): table rows get incorrect height after changing some cells' height<br>https://bugs.webkit.org/show_bug.cgi?id=74303");
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    Element firstRow = document.getElementById("firstRow");
    // Original value.
    shouldBe(firstRow.getComputedStyle('').getPropertyValue('height'), '40px');

    toggleSmallRows();
    shouldBe(firstRow.getComputedStyle('').getPropertyValue('height'), '20px');
    toggleSmallRows();
    shouldBe(firstRow.getComputedStyle('').getPropertyValue('height'), '40px');
    
    checkTestFailures();
}
