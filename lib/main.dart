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
 * @since Mar 03, 2020
 */

library dart_tour;

// A tour of the Dart language: https://dart.dev/guides/language/language-tour
void main() {
  // 1. A basic Dart program.
  // This is a comment.
  /*
   * This is
   * multi-line comments.
   */
  print('Hello world!');

  // Define a function.
  printInteger(int aNumber) {
    print('The number is $aNumber.'); // Print to console.
  }

  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.

  // 2. Important concepts.
  /**
   * As you learn about the Dart language, keep these facts and concepts in mind:
   *
   * - Everything you can place in a variable is an object, and every object is an instance of a class.
   *   Even numbers, functions, and null are objects. All objects inherit from the "Object" class.
   *
   * - Although Dart is strongly typed, type annotations are optional because Dart can infer types.
   *   When you want to explicitly say that no type is expected, use the special type "dynamic".
   *
   * - Dart supports generic types, like List<int> (a list of integers) or List<dynamic> (a list of objects of any type).
   *
   * - Dart supports top-level functions (such as main()), as well as functions tied to a class or object (static and instance methods, respectively).
   *   You can also create functions within functions (nested or local functions).
   *
   * - Similarly, Dart supports top-level variables, as well as variables tied to a class or object (static and instance variables).
   *   Instance variables are sometimes known as fields or properties.
   *
   * - Unlike Java, Dart doesn’t have the keywords public, protected, and private.
   *   If an identifier starts with an underscore (_), it’s private to its library.
   *
   * - Identifiers can start with a letter or underscore (_), followed by any combination of those characters plus digits.
   *
   * - Dart has both expressions (which have runtime values) "condition ? expr1 : expr2"
   *   and statements (which don’t) if-else.
   *
   * - Dart tools can report two kinds of problems: warnings and errors (compile-time or run-time).
   */

  // 3. Variables
  // Variables store references.
  var name = 'Bob';
  print(name.runtimeType); // String
  // name = 10; //==> Error: A value of type 'int' can't be assigned to a variable of type 'String'.

  // no type
  dynamic name1 = 'Bob';
  print(name1.runtimeType); // String
  name1 = 10;
  print(name1.runtimeType); // int

  // declare the type
  String name3 = 'Bob';
  // name3 = 10; //==> Error: A value of type 'int' can't be assigned to a variable of type 'String'.

  // Uninitialized variables have an initial value of "null".
  int lineCount;
  print(lineCount); // null

  // Final and const: A final variable can be set only once; a const variable is a compile-time constant.
  final fname = 'Bob'; // Without a type annotation
  final String nickname = 'Bobby';
  // Error: a final variable can only be set once.
  //fname = 'Alice'; //==> Error: Setter not found: 'fname'.
  const bar = 1000000; // Without a type annotation
  const double atm = 1.01325 * bar; // Standard atmosphere
  // Error: a const variable is a compile-time constant.
  //bar = 1000; //==> Error: Setter not found: 'bar'.
  var foo = const [];
  final baf = const [];
  const bac = []; // Equivalent to `const []`
  foo = [1, 2, 3]; // Was const []
  // Error: a final variable can only be set once.
  //baf = [42]; //==> Error: Setter not found: 'baf'.
  // Error: Constant variables can't be assigned a value.
  //bac = [42]; //==> Error: Setter not found: 'bac'.

  // Valid compile-time constants as of Dart 2.5.
  const Object i = 3; // Where i is a const Object with an int value...
  const list = [i as int]; // Use a typecast.
  const map = {if (i is int) i: "int"}; // Use is and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread.
  print(list); // [3]
  print(map); // {3: int}
  print(set); // {3}

  // Convert value.
  // String -> int
  var one = int.parse('1');
  assert(one == 1);
  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);
  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');
  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  // bitwise shift (<<, >>), AND (&), and OR (|) operators
  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 >> 1) == 1); // 0011 >> 1 == 0001
  assert((3 | 4) == 7); // 0011 | 0100 == 0111
  assert((3 & 2) == 2); // 0011 & 0010 == 0010

  // Strings: A Dart string is a sequence of UTF-16 code units.
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";
  var ms1 = '''
You can create
multi-line strings like this one.
''';
  var ms2 = """This is also a
multi-line string.""";
  //print(ms1);
  //print(ms2);
  var raws = r'In a raw string, not even \n gets special treatment.';
  print(raws); //==> In a raw string, not even \n gets special treatment.

}
