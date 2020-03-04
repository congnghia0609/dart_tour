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
 * @since Mar 04, 2020
 */

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
