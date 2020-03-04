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
