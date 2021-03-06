/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a lazy Iterable with all elements that satisfy the predicate test.
 * Iterating will not cache results, and thus iterating multiple times over the returned
 * Iterable will invoke the supplied function test multiple times on the same element.
 * @description Checks that all elements that satisfy test are retained, and
 * elements that do not, are skipped.
 * Checks that iterating multiple times over the returned Iterable will invoke
 * the supplied function test multiple times on the same element.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

void check(LinkedList<MyLinkedListEntry<int>> a0, bool test0(int element)) {
  bool test(MyLinkedListEntry<int> entry)=>test0(entry.value);
  
  for (int k=0; k<5; k++) {
    Iterator<MyLinkedListEntry<int>> it0=a0.iterator;
    Iterator<MyLinkedListEntry<int>> it=a0.where(test).iterator;

    while (it0.moveNext()) {
      if (test(it0.current)) {
        Expect.isTrue(it.moveNext());
        Expect.identical(it0.current, it.current);
      }
    }
    Expect.isFalse(it.moveNext());
  }
}

main() {
  LinkedList<MyLinkedListEntry<int>> a0=toLinkedList([1,3,7,4,5,6,1]);
  check(a0, (int element)=>element==1);
  return;
  check(a0, (int element)=>true);
  check(a0, (int element)=>false);
  check(a0, (int element)=>element>4);
  check(a0, (int element)=>element<4);
  check(a0, (int element)=>element==4);
}
