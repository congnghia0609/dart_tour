# dart_tour
dart_tour is a cheat sheet, quick reference to learn dart programming

## Getting Started

```dart
import 'package:meta/meta.dart';

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
   * - Dart supports generic types, like List<int> (a list of integers) or
   *   List<dynamic> (a list of objects of any type).
   *
   * - Dart supports top-level functions (such as main()), as well as functions tied to a class or
   *   object (static and instance methods, respectively).
   *   You can also create functions within functions (nested or local functions).
   *
   * - Similarly, Dart supports top-level variables, as well as variables tied to a class or
   *   object (static and instance variables).
   *   Instance variables are sometimes known as fields or properties.
   *
   * - Unlike Java, Dart doesn’t have the keywords public, protected, and private.
   *   If an identifier starts with an underscore (_), it’s private to its library.
   *
   * - Identifiers can start with a letter or underscore (_), followed by any combination of
   *   those characters plus digits.
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

  // Final and const: 
  // A final variable can be set only once; a const variable is a compile-time constant.
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
  const lst = [i as int]; // Use a typecast.
  const map = {if (i is int) i: "int"}; // Use is and collection if.
  const set = {if (lst is List<int>) ...lst}; // ...and a spread.
  print(lst); // [3]
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

  // Booleans
  // Check for an empty string.
  var fullName = '';
  assert(fullName.isEmpty);
  // Check for zero.
  var hitPoints = 0;
  assert(hitPoints <= 0);
  // Check for null.
  var unicorn;
  assert(unicorn == null);
  // Check for NaN.
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);

  // Lists
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);
  list[1] = 1;
  assert(list[1] == 1);

  // Iterator List
  for (int i = 0; i < list.length; i++) {
    print('${i}: ${list[i]}');
  }
  void printElement(int element) {
    print(element);
  }

  // Pass printElement as a parameter.
  list.forEach(printElement);
  list.forEach((item) {
    print('${list.indexOf(item)}: $item');
  });
  list.forEach((item) => print('${list.indexOf(item)}: $item'));

  // constant List
  var constantList = const [1, 2, 3];
  // constantList[1] = 1; // Uncommenting this causes an error.
  var list2 = [0, ...list];
  assert(list2.length == 4);
  // avoid exceptions by using a null list.
  var list3;
  var list4 = [0, ...?list3];
  assert(list4.length == 1);

  // Dart 2.3 also introduced "collection if" and "collection for"
  var promoActive = false;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav); // [Home, Furniture, Plants]
  // collection for
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings); // [#0, #1, #2, #3]

  // Sets
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  var names = <String>{};
  // Set<String> names = {}; // This works, too.
  // var names = {}; // Creates a map, not a set.
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  assert(elements.length == 5);

  final constantSet = const {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // constantSet.add('helium'); // Uncommenting this causes an error.

  // Maps
  // Map<String, String>
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };
  // Map<int, String>
  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };
  var gifts2 = Map();
  gifts2['first'] = 'partridge';
  gifts2['second'] = 'turtledoves';
  gifts2['fifth'] = 'golden rings';
  var nobleGases2 = Map();
  nobleGases2[2] = 'helium';
  nobleGases2[10] = 'neon';
  nobleGases2[18] = 'argon';
  // constant Map
  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };
  // constantMap[2] = 'Helium'; // Uncommenting this causes an error.

  // Functions
  bool isNoble(int atomicNumber) {
    return nobleGases[atomicNumber] != null;
  }

  // omit the types return
  isNoble2(atomicNumber) {
    return nobleGases[atomicNumber] != null;
  }

  // shorthand syntax (arrow syntax)
  bool isNoble3(int atomicNumber) => nobleGases[atomicNumber] != null;

  // Optional parameters
  // When defining a function, use {param1, param2, …} to specify named parameters:
  void enableFlags({bool bold, bool hidden}) {}
  // use @required to indicate that the parameter is mandatory.
  void enableFlags2({@required bool bold, bool hidden}) {}
  // Wrapping a set of function parameters in [] marks
  String say(String from, String msg, [String device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }

  assert(say('Bob', 'Howdy') == 'Bob says Howdy');
  assert(say('Bob', 'Howdy', 'smoke signal') == 'Bob says Howdy with a smoke signal');

  // Default parameter values
  void enableFlags3({bool bold = false, bool hidden = false}) {}
  void doStuff(
      {List<int> list = const [1, 2, 3],
      Map<String, String> gifts = const {'first': 'paper', 'second': 'cotton', 'third': 'leather'}}) {
    print('list:  $list');
    print('gifts: $gifts');
  }

  // Lexical scope
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }

  // Lexical closures
  /// Returns a function that adds [addBy] to the function's argument.
  Function makeAdder(num addBy) {
    return (num i) => addBy + i;
  }

  // Create a function that adds 2.
  var add2 = makeAdder(2);
  // Create a function that adds 4.
  var add4 = makeAdder(4);
  assert(add2(3) == 5);
  assert(add4(3) == 7);

  // 4. Operators
  /**
   * 1. unary postfix:            expr++    expr--    ()    []    .    ?.
   * 2. unary prefix:             -expr    !expr    ~expr    ++expr    --expr    await    expr
   * 3. multiplicative:           *    /    %    ~/
   * 4. additive:                 +    -
   * 5. shift:                    <<    >>    >>>
   * 6. bitwise AND, XOR, OR:     &    ^    |    ~expr
   * 7. relational, type test:    >=    >    <=    <    as    is    is!
   * 8. equality:                 ==    !=
   * 9. logical NOT, AND, OR:     !expr    &&    ||
   * 10. if null:                 ??
   * 11. conditional:             expr1 ? expr2 : expr3
   * 12. cascade:                 ..
   * 13. assignment:              =    *=    /=   +=   -=   &=   ^=    ~/=    &=    |=    >>=    <<=
   *
   */
  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an int
  assert(5 % 2 == 1); // Remainder

  /**
   * as     Typecast (also used to specify library prefixes)
   * is     True if the object has the specified type
   * is!    False if the object has the specified type
   */
  // cast an object to a particular type.
  //(emp as Person).firstName = 'Bob';
  // check the type before using the object.
  //if (emp is Person) {
  //  emp.firstName = 'Bob';
  //}

  // Assign value to b if b is null; otherwise, b stays the same.
  var b;
  var v = 1;
  b ??= v;
  assert(b == 1);

  // Bitwise and shift operators
  final value = 0x22; // 34
  final bitmask = 0x0f; // 15
  assert((value & bitmask) == 0x02); // AND
  // ~expr : Unary bitwise complement (0s become 1s; 1s become 0s)
  assert((value & ~bitmask) == 0x20); // AND NOT
  assert((value | bitmask) == 0x2f); // OR
  assert((value ^ bitmask) == 0x2d); // XOR
  assert((value << 4) == 0x220); // Shift left
  assert((value >> 4) == 0x02); // Shift right

  // 5. Control flow statements
  /**
   * if else
   * for
   * while, do-while
   * break, continue
   * switch case
   * assert
   */
  // If and else
  var isRaining = true;
  var isSnowing = false;
  if (isRaining) {
    print("you bring RainCoat");
  } else if (isSnowing) {
    print("you wear Jacket");
  } else {
    print("car put Top Down");
  }
  // For loops
  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }
  print(message);
  var collection = [0, 1, 2];
  for (var x in collection) {
    print(x);
  }
  //==> 0 1 2
  collection.forEach((x) => print(x));
  //==> 0 1 2
  collection.where((c) => c >= 1).forEach((c) => print(c));
  //=> 1 2

  // While and do-while
  /**
   * while (!isDone()) {
   *  doSomething();
   * }
   */
  /**
   * do {
   *  printLine();
   * } while (!atEndOfPage());
   */

  // Switch and case
  var command = 'OPEN';
  switch (command) {
    case 'CLOSED':
      //executeClosed();
      print("executeClosed()");
      break;
    case 'PENDING':
      //executePending();
      print("executePending()");
      break;
    case 'APPROVED':
      //executeApproved();
      print("executeApproved()");
      break;
    case 'DENIED':
      //executeDenied();
      print("executeDenied()");
      break;
    case 'OPEN':
      //executeOpen();
      print("executeOpen()");
      break;
    default:
      //executeUnknown();
      print("executeUnknown()");
  }

  // 6. Exceptions: try catch finally
  try {
    // throw FormatException('Expected at least 1 section');
    // throw 'Out of llamas!';

    //breedMoreLlamas();
  } on OutOfLlamasException {
    // A specific exception
    //buyMoreLlamas();
  } on Exception catch (e) {
    // Anything else that is an exception
    print('Unknown exception: $e');
  } catch (e, s) {
    // No specified type, handles all
    print('Exception details: $e \n');
    print('Stack trace: $s \n');
  } finally {
    // Always clean up, even if an exception is thrown.
    //cleanLlamaStalls();
  }

  // 7. Generics
  /**
   * Why use generics?
   * - Properly specifying generic types results in better generated code.
   * - You can use "generics" to reduce code duplication.
   */

  // 8. Asynchrony support
  /**
   * Dart libraries are full of functions that return Future or Stream objects.
   * These functions are asynchronous: they return after setting up
   * a possibly time-consuming operation (such as I/O),
   * without waiting for that operation to complete.
   *
   * The "async" and "await" keywords support asynchronous programming,
   * letting you write asynchronous code that looks similar to synchronous code.
   */
  checkVersion();

  // 9. Callable classes
  var wf = new WannabeFunction();
  var out = wf("Hi","there,","gang");
  print('$out');
  //==> Hi there, gang!
}

class OutOfLlamasException implements Exception {}

// 7. Generics
// 7.1. Reduce code duplication.
abstract class ObjectCache {
  Object getByKey(String key);

  void setByKey(String key, Object value);
}

abstract class StringCache {
  String getByKey(String key);

  void setByKey(String key, String value);
}

//=> reduce code duplication.
abstract class Cache<T> {
  T getByKey(String key);

  void setByKey(String key, T value);
}

// 7.2. Generic class
// Restricting the parameterized type
/**
    class Foo<T extends SomeBaseClass> {
    // Implementation goes here...
    String toString() => "Instance of 'Foo<$T>'";
    }

    class Extender extends SomeBaseClass {}

    var someBaseClassFoo = Foo<SomeBaseClass>();
    var extenderFoo = Foo<Extender>();

    var foo = Foo();
    print(foo); // Instance of 'Foo<SomeBaseClass>'

    var foo = Foo<Object>(); //==> Error
 */

// 7.3. Generic methods
T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}

// 8. Asynchrony support
Future<String> lookUpVersion() async => '1.0.0';

Future checkVersion() async {
  var version = await lookUpVersion();
  // Do something with version
  print(version);
}

// 9. Callable classes
class WannabeFunction {
  call(String a, String b, String c) => '$a $b $c!';
}
```

## Class
```dart
import 'dart:math';

// https://codelabs.developers.google.com/codelabs/from-java-to-dart/#1
void main() {
  // 1. Create a simple Dart class
  var bike = new Bicycle(2, 1);
  bike.speedUp(10);
  print(bike);
  //==> Bicycle{speed: 10 mph}

  // 2. Use optional parameters (instead of overloading)
  print(Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  print(Rectangle(origin: const Point(10, 10)));
  print(Rectangle(width: 200));
  print(Rectangle());
//  Origin: (10, 20), width: 100, height: 200
//  Origin: (10, 10), width: 0, height: 0
//  Origin: (0, 0), width: 200, height: 0
//  Origin: (0, 0), width: 0, height: 0

  // 3. Create a factory
  final circle = Circle(2);
  final square = Square(2);
  print(circle.area);
  print(square.area);
//  12.566370614359172
//  4

  // 3.1. Option 1: Create a top-level function
  final circlef = shapeFactory('circle');
  final squaref = shapeFactory('square');
  print(circlef.area);
  print(squaref.area);
//  12.566370614359172
//  4

  // 3.2. Option 2: Create a factory constructor
  final circlec = Shape('circle');
  final squarec = Shape('square');
  print(circlec.area);
  print(squarec.area);
//  12.566370614359172
//  4

  // 4. Implement an interface
  // see CircleMock

  // 5. Use Dart for functional programming
  final values = [1, 2, 3, 5, 10, 50];
  for (var length in values) {
    print(scream(length));
  }
//  Aah!
//  Aaah!
//  Aaaah!
//  Aaaaaah!
//  Aaaaaaaaaaah!
//  Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah!

  // Convert imperative code to functional
  values.map(scream).forEach(print);
//  Aah!
//  Aaah!
//  Aaaah!
//  Aaaaaah!
//  Aaaaaaaaaaah!
//  Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah!

  // Use more Iterable features
  values.skip(1).take(3).map(scream).forEach(print);
//  Aaah!
//  Aaaah!
//  Aaaaaah!
}

class Bicycle {
  int cadence;
  int _speed = 0;
  int gear;

  Bicycle(this.cadence, this.gear);

  // the same:
  /**
   * Bicycle(int cadence, int speed, int gear) {
   *  this.cadence = cadence;
   *  this.speed = speed;
   *  this.gear = gear;
   *  }
   */

  int get speed => _speed;

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  @override
  String toString() {
    return 'Bicycle{speed: $_speed mph}';
  }
}

class Rectangle {
  int width;
  int height;
  Point origin;

  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});

  @override
  String toString() => 'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}

abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw "Can't create $type.";
  }

  num get area;
}

class Circle implements Shape {
  final num radius;

  Circle(this.radius);

  @override
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;

  Square(this.side);

  @override
  num get area => pow(side, 2);
}

Shape shapeFactory(String type) {
  if (type == 'circle') return Circle(2);
  if (type == 'square') return Square(2);
  throw "Can't create $type.";
}

class CircleMock implements Circle {
  num area;
  num radius;
}

String scream(int length) => "A${'a' * length}h!";
```

## A tour of the core libraries
```dart
import 'dart:math';
import 'dart:convert';

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
}
```