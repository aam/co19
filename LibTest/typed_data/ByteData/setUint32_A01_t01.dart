/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setUint32(int byteOffset, int value, [Endianness endian = Endianness.BIG_ENDIAN])
 * Sets the four bytes starting at the specified [byteOffset] in this object
 * to the unsigned binary representation of the specified [value],
 * which must fit in four bytes. in other words, [value] must be between
 * 0 and 2<sup>32</sup> - 1, inclusive.
 * @description Checks that the value at the [offset] is set to [value].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var u32 = new Uint32List(16);
  var valuesToBeSet = [123, 95, 25, 98, 0, 113, 20, 9, 1, 4294967295, 2147483648, 25, 69, 52, 125, 31];
  var expectedBigEndian =
    [2063597568, 1593835520, 419430400, 1644167168, 0, 1895825408, 335544320, 150994944,
    16777216, 4294967295, 128, 419430400, 1157627904, 872415232, 2097152000, 520093696];

  var byteDataFromU32 = new ByteData.view(u32.buffer);
  for(int i = 0; i < byteDataFromU32.lengthInBytes / Int32List.BYTES_PER_ELEMENT; ++i) {
    byteDataFromU32.setUint32(i * Int32List.BYTES_PER_ELEMENT, valuesToBeSet[i], Endianness.LITTLE_ENDIAN);
  }
  Expect.listEquals(valuesToBeSet, u32);

  for(int i = 0; i < byteDataFromU32.lengthInBytes / Int32List.BYTES_PER_ELEMENT; ++i) {
    byteDataFromU32.setUint32(i * Int32List.BYTES_PER_ELEMENT, valuesToBeSet[i]);
  }
  Expect.listEquals(expectedBigEndian, u32);
}
