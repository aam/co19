/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString() returns string constructed for the [timeZone] of this instance. 
 * @description check various dates
 * @author hlodvig
 * @reviewer msyabro
 * @needsreview implementation based test. It would be good to define format of the returned string in the API
 */

main() {
  Expect.equals("1-01-01 00:00:00.000", new Date(1, 1, 1, 0, 0, 0, 0).toString());
  Expect.equals("1-01-01 00:00:00.000Z", new Date.withTimeZone(1, 1, 1, 0, 0, 0, 0, new TimeZone.utc()).toString());
  Expect.equals("2001-01-01 00:00:00.000", new Date(2001, 1, 1, 0, 0, 0, 0).toString());
  Expect.equals("2001-12-31 23:59:59.999", new Date(2001, 12, 31, 23, 59, 59, 999).toString());
  Expect.equals("2001-01-01 00:00:00.000Z", new Date.withTimeZone(2001, 1, 1, 0, 0, 0, 0, new TimeZone.utc()).toString());
  Expect.equals("2001-12-31 23:59:59.999Z", new Date.withTimeZone(2001, 12, 31, 23, 59, 59, 999, new TimeZone.utc()).toString());
}