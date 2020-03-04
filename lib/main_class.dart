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

  // 2. Use optional parameters (instead of overloading)
  print(Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  print(Rectangle(origin: const Point(10, 10)));
  print(Rectangle(width: 200));
  print(Rectangle());

  // 3. Create a factory

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
