/*
 * Copyright 2020 nghiatc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 *
 * @author nghiatc
 * @since Mar 05, 2020
 */

import 'dart:math';
import 'dart:convert';
import 'dart:io';

// A tour of the core libraries
// https://dart.dev/guides/libraries/library-tour
void main() {
  // 1. dart:core - numbers, collections, strings, and more
  //// Numbers
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
  // radix
  assert(int.parse('42', radix: 16) == 66);

  //// String
  /// Convert an int to a string.
  assert(42.toString() == '42');
  // Convert a double to a string.
  assert(123.456.toString() == '123.456');
  // Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46');
  // Specify the number of significant figures.
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  /// Strings and regular expressions
  // Check whether a string contains another string.
  assert('Never odd or even'.contains('odd'));
  // Does a string start with another string?
  assert('Never odd or even'.startsWith('Never'));
  // Does a string end with another string?
  assert('Never odd or even'.endsWith('even'));
  // Find the location of a string inside a string.
  assert('Never odd or even'.indexOf('odd') == 6);

  /// Extracting data from a string
  // Grab a substring.
  assert('Never odd or even'.substring(6, 9) == 'odd');
  // Split a string using a string pattern.
  var parts = 'structured web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'structured');
  // Get a UTF-16 code unit (as a string) by index.
  assert('Never odd or even'[0] == 'N');
  // Use split() with an empty string parameter to get
  // a list of all characters (as Strings); good for
  // iterating.
  for (var char in 'hello'.split('')) {
    print(char);
  }
  // Get all the UTF-16 code units in the string.
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  /// Converting to uppercase or lowercase
  // Convert to uppercase.
  assert('structured web apps'.toUpperCase() == 'STRUCTURED WEB APPS');

  // Convert to lowercase.
  assert('STRUCTURED WEB APPS'.toLowerCase() == 'structured web apps');

  /// Trimming and empty strings
  // Trim a string.
  assert('  hello  '.trim() == 'hello');
  // Check whether a string is empty.
  assert(''.isEmpty);
  // Strings with only white space are not empty.
  assert('  '.isNotEmpty);

  /// Replacing part of a string
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');
  // greetingTemplate didn't change.
  assert(greeting != greetingTemplate);
  assert(greeting == 'Hello, Bob!');

  /// Building a string
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');
  var fullString = sb.toString();
  assert(fullString == 'Use a StringBuffer for efficient string creation.');

  /// Regular expressions
  // Here's a regular expression for one or more digits.
  var numbers = RegExp(r'\d+');
  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';
  // contains() can use a regular expression.
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));
  // Replace every match with another string.
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
  // Check whether the reg exp has a match in a string.
  assert(numbers.hasMatch(someDigits));
  // Loop through all matches.
  for (var match in numbers.allMatches(someDigits)) {
    print(match.group(0)); // 15, then 20
  }

  //// Collections
  /// Lists
  // Use a List constructor.
  var vegetables = List();
  // Or simply use a list literal.
  var fruits = ['apples', 'oranges'];
  // Add to a list.
  fruits.add('kiwis');
  // Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);
  // Get the list length.
  assert(fruits.length == 5);
  // Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);
  // Remove all elements from a list.
  fruits.clear();
  assert(fruits.isEmpty);
  // Sort a list.
  fruits = ['bananas', 'apples', 'oranges'];
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');
  // Iterator
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  teas.forEach((tea) => print('I drink $tea'));
  for (var tea in teas) {
    print('I drink $tea');
  }
  // map method
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  /// Sets
  var ingredients = Set();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);
  // Adding a duplicate item has no effect.
  ingredients.add('gold');
  assert(ingredients.length == 3);
  // Remove an item from a set.
  ingredients.remove('gold');
  assert(ingredients.length == 2);
  // contains
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  // Check whether an item is in the set.
  assert(ingredients.contains('titanium'));
  // Check whether all the items are in the set.
  assert(ingredients.containsAll(['titanium', 'xenon']));
  // intersection
  // Create the intersection of two sets.
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  //==> {xenon}
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));

  /// Maps
  // Maps can be built from a constructor.
  var searchTerms = Map();
  // Maps are parameterized types; you can specify what
  // types the key and value should be.
  var specifyMap = Map<int, String>();
  // Map operators
  var myMap = {54: 'xenon'};
  // Retrieve a value with a key.
  assert(myMap[54] == 'xenon');
  // Check whether a map contains a key.
  assert(myMap.containsKey(54));
  // Remove a key and its value.
  myMap.remove(54);
  assert(!myMap.containsKey(54));
  // Maps often use strings as keys.
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  // Get all the keys as an unordered collection
  // (an Iterable).
  var keys = hawaiianBeaches.keys;
  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));
  // Get all the values as an unordered collection (an Iterable of Lists).
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));
  // Check key
  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));
  // Iterator
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at
    // [Waikiki, Kailua, Waimanalo], etc.
  });
  for (var k in hawaiianBeaches.keys) {
    print('I want to visit $k and swim at ${hawaiianBeaches[k]}');
  }

  // 2. URIs
  // Encoding and decoding fully qualified URIs
  var uri = 'https://example.org/api?foo=some message';
  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');
  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);
  // Encoding and decoding URI components
  var encodec = Uri.encodeComponent(uri);
  assert(encodec == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');
  var decodec = Uri.decodeComponent(encodec);
  assert(uri == decodec);
  // Parsing URIs
  var uri2 = Uri.parse('https://example.org:8080/foo/bar#frag');
  assert(uri2.scheme == 'https');
  assert(uri2.host == 'example.org');
  assert(uri2.port == 8080);
  assert(uri2.path == '/foo/bar');
  assert(uri2.fragment == 'frag');
  assert(uri2.origin == 'https://example.org:8080');
  // Building URIs
  var uri3 = Uri(scheme: 'https', host: 'example.org', path: '/foo/bar', fragment: 'frag');
  assert(uri3.toString() == 'https://example.org/foo/bar#frag');

  // 3. Dates and times
  // Get the current date and time.
  var now = DateTime.now();
  // Create a new DateTime with the local time zone.
  var y2k = DateTime(2000); // January 1, 2000
  // Specify the month and day.
  y2k = DateTime(2000, 1, 2); // January 2, 2000
  // Specify the date as a UTC time.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC
  // Specify a date and time in ms since the Unix epoch.
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
  // Parse an ISO 8601 date.
  y2k = DateTime.parse('2000-01-01T00:00:00Z');

  // 1/1/2000, UTC
  y2k = DateTime.utc(2000);
  assert(y2k.millisecondsSinceEpoch == 946684800000);
  // 1/1/1970, UTC
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);

  // Add one year.
  var y2001 = y2k.add(Duration(days: 366));
  assert(y2001.year == 2001);

  // Subtract 30 days.
  var december2000 = y2001.subtract(Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);

  // Calculate the difference between two dates.
  // Returns a Duration object.
  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366); // y2k was a leap year.

  // 4. dart:math - math and random
  /// Trigonometry - Luong Giac
  // Cosine
  assert(cos(pi) == -1.0);
  // Sine
  var degrees = 30;
  var radians = degrees * (pi / 180);
  // radians is now 0.52359.
  var sinOf30degrees = sin(radians);
  // sin 30° = 0.5
  assert((sinOf30degrees - 0.5).abs() < 0.01);
  // Maximum and minimum
  assert(max(1, 1000) == 1000);
  assert(min(1, -1000) == -1000);
  // Math constants
  // See the Math library for additional constants.
  print(e); // 2.718281828459045
  print(pi); // 3.141592653589793
  print(sqrt2); // 1.4142135623730951
  // Random numbers
  var random = Random();
  print(random.nextDouble()); // Between 0.0 and 1.0: [0, 1)
  print(random.nextInt(10)); // Between 0 and 9.
  print(random.nextBool()); // true or false

  // 5. dart:convert - decoding and encoding JSON, UTF-8, and more
  /// Decoding and encoding JSON
  // NOTE: Be sure to use double quotes ("),
  // not single quotes ('), inside the JSON string.
  // This string is JSON, not Dart.
  var jsonString = '''
    [
      {"score": 40},
      {"score": 80}
    ]
  ''';
  var scores = jsonDecode(jsonString);
  assert(scores is List);
  var firstScore = scores[0];
  assert(firstScore is Map);
  assert(firstScore['score'] == 40);

  var scores2 = [
    {'score': 40},
    {'score': 80},
    {'score': 100, 'overtime': true, 'special_guest': null}
  ];
  var jsonText = jsonEncode(scores2);
  assert(jsonText == '[{"score":40},{"score":80},'
          '{"score":100,"overtime":true,'
          '"special_guest":null}]');

  /// Decoding and encoding UTF-8 characters
  List<int> utf8Bytes = [
    0xc3, 0x8e, 0xc3, 0xb1, 0xc5, 0xa3, 0xc3, 0xa9,
    0x72, 0xc3, 0xb1, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3,
    0xae, 0xc3, 0xb6, 0xc3, 0xb1, 0xc3, 0xa5, 0xc4,
    0xbc, 0xc3, 0xae, 0xc5, 0xbe, 0xc3, 0xa5, 0xc5,
    0xa3, 0xc3, 0xae, 0xe1, 0xbb, 0x9d, 0xc3, 0xb1
  ];
  var funnyWord = utf8.decode(utf8Bytes);
  assert(funnyWord == 'Îñţérñåţîöñåļîžåţîờñ');
  List<int> encodeUtf8 = utf8.encode('Îñţérñåţîöñåļîžåţîờñ');
  assert(encodeUtf8.length == utf8Bytes.length);
  for (int i = 0; i < encodeUtf8.length; i++) {
    assert(encodeUtf8[i] == utf8Bytes[i]);
  }

  // 6. dart:io - I/O for servers and command-line apps
  /// Files and directories

  // Reading a file as text
  var config = File('config.txt');
  var contents;
  // Put the whole file in a single string.
  contents = config.readAsStringSync();
  print('The file is ${contents.length} characters long.');
  // Put each line of the file into its own string.
  contents = config.readAsLinesSync();
  print('The file is ${contents.length} lines long.');
  // Reading a file as binary
  var contentBytes = config.readAsBytesSync();
  print('The file is ${contentBytes.length} bytes long.');

  // Writing file contents
  var logFile = File('log.txt');
  if (!logFile.existsSync()) {
    logFile.createSync();
  }
  var sink = logFile.openSync(mode: FileMode.append);
  sink.writeStringSync('FILE ACCESSED ${DateTime.now()}\n');
  sink.flushSync();
  sink.closeSync();
}
