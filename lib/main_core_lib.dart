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
}
