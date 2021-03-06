/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description An event generated on the edge of a table cell is not being consumed by the appropriate underlying element.
 * This test verifies that the hittest result on the right edge of a table cell returns the proper underlying element.
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL1 = r'''
<style>
    table
    {
        border-spacing: 0px;
        font-size: 1000%;
    }
    td { padding: 0px; }
</style>
''';

const String htmlEL2 = r'''
    <p>Test for Bugzilla <a href="https://bugs.webkit.org/show_bug.cgi?id=74864">Bug 74864</a>: There is additional space not belonged to a table between the table cells.</p>
    <table cellspacing=0>
        <tr id="tr1">
            <td id="tr1-td1">1</td>
            <td id="tr1-td2">1</td>
            <td id="tr1-td3"></td>
            <td id="tr1-td4">1</td>
        </tr>
        <tr id="tr2">
            <td id="tr2-td1">1</td>
            <td id="tr2-td2">1</td>
            <td id="tr2-td3"></td>
            <td id="tr2-td4">1</td>
        </tr>
        <tr id="tr3">
            <td id="tr3-td1"></td>
            <td id="tr3-td2"></td>
            <td id="tr3-td3"></td>
            <td id="tr3-td4"></td>
        </tr>  
        <tr id="tr4">
            <td id="tr4-td1">1</td>
            <td id="tr4-td2">1</td>
            <td id="tr4-td3"></td>            
            <td id="tr4-td4">1</td>
        </tr>              
    </table>
    <p id="description"></p>
    <div id="console"></div>
''';

void hittest(ele, orgElement) {  
    int edge = ele.getBoundingClientRect().right.toInt();
    int middleY = (ele.getBoundingClientRect().bottom / 2).toInt();
    print('Executing for element $orgElement on the right edge of the table cell: middleY=$middleY');

    switch (orgElement) {
    case 'tr1-td1':
        shouldBe(document.elementFromPoint(edge - 1, middleY).id, 'tr1-td1');
        shouldBe(document.elementFromPoint(edge, middleY).id, 'tr1-td2');
        shouldBe(document.elementFromPoint(edge + 1, middleY).id, 'tr1-td2');
        break;
    case 'tr1-td2':
        shouldBe(document.elementFromPoint(edge - 1, middleY).id, 'tr1-td2');
        shouldBe(document.elementFromPoint(edge, middleY).id, 'tr1-td4');
        shouldBe(document.elementFromPoint(edge + 1, middleY).id, 'tr1-td4');
        break;        
    case 'tr1-td3':
        shouldBe(document.elementFromPoint(edge - 1, middleY).id, 'tr1-td2');
        shouldBe(document.elementFromPoint(edge, middleY).id, 'tr1-td4');
        shouldBe(document.elementFromPoint(edge + 1, middleY).id, 'tr1-td4');
        break;
    case 'tr1-td4':
        shouldBe(document.elementFromPoint(edge - 1, middleY).id, 'tr1-td4');
        shouldBe(document.elementFromPoint(edge, middleY).id, '');
        shouldBe(document.elementFromPoint(edge + 1, middleY).id, '');
        break;
    case 'tr2-td1':
        shouldBe(document.elementFromPoint(edge - 1, middleY).id, 'tr2-td1');
        shouldBe(document.elementFromPoint(edge, middleY).id, 'tr2-td2');
        shouldBe(document.elementFromPoint(edge + 1, middleY).id, 'tr2-td2');
        break;
    case 'tr2-td2':
    case 'tr2-td3':        
        shouldBe(document.elementFromPoint(edge - 1, middleY).id, 'tr2-td2');
        shouldBe(document.elementFromPoint(edge, middleY).id, 'tr2-td4');
        shouldBe(document.elementFromPoint(edge + 1, middleY).id, 'tr2-td4');
        break; 
    case 'tr2-td4':
        shouldBe(document.elementFromPoint(edge - 1, middleY).id, 'tr2-td4');
        shouldBe(document.elementFromPoint(edge, middleY).id, '');
        shouldBe(document.elementFromPoint(edge + 1, middleY).id, '');
        break;
    case 'tr3-td1':
    case 'tr3-td2':
    case 'tr3-td3':
    case 'tr3-td4':
        shouldBe(document.elementFromPoint(edge - 1, middleY).id, '');
        shouldBe(document.elementFromPoint(edge, middleY).id, '');
        shouldBe(document.elementFromPoint(edge + 1, middleY).id, '');
        break;
    case 'tr4-td1':
        shouldBe(document.elementFromPoint(edge - 1, middleY).id, 'tr4-td1');
        shouldBe(document.elementFromPoint(edge, middleY).id, 'tr4-td2');
        shouldBe(document.elementFromPoint(edge + 1, middleY).id, 'tr4-td2');
        break;
    case 'tr4-td2':
        shouldBe(document.elementFromPoint(edge - 1, middleY).id, 'tr4-td2');
        shouldBe(document.elementFromPoint(edge, middleY).id, 'tr4-td4');
        shouldBe(document.elementFromPoint(edge + 1, middleY).id, 'tr4-td4');
        break;        
    case 'tr4-td3':        
        shouldBe(document.elementFromPoint(edge - 1, middleY).id, '');
        shouldBe(document.elementFromPoint(edge, middleY).id, 'tr4-td4');
        shouldBe(document.elementFromPoint(edge + 1, middleY).id, 'tr4-td4');
        break;
    case 'tr4-td4':
        shouldBe(document.elementFromPoint(edge - 1, middleY).id, 'tr4-td4');
        shouldBe(document.elementFromPoint(edge, middleY).id, '');
        shouldBe(document.elementFromPoint(edge + 1, middleY).id, '');
        break;
    default:
        break;
    }
}

void runTest(e) {
    printPassed=true;
    ['tr1-td1', 'tr1-td2', 'tr1-td3', 'tr1-td4',
     'tr2-td1', 'tr2-td2', 'tr2-td3', 'tr2-td4',
     'tr3-td1', 'tr3-td2', 'tr3-td3', 'tr3-td4',
     'tr4-td1', 'tr4-td2', 'tr4-td3', 'tr4-td4'].forEach((a) {
        Element elem = document.getElementById(a);
        hittest(elem, a);
        elem.innerHtml = '';
    });

    checkTestFailures();
}

void main() {
    description("""An event generated on the edge of a table cell is not being consumed by the appropriate underlying element.
     This test verifies that the hittest result on the right edge of a table cell returns the proper underlying element.""");
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    window.onLoad.listen(runTest);
}
