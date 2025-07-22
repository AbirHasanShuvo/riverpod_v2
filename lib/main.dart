import 'package:flutter/widgets.dart';

void main() {
  Person person = Person(name: 'Md. Abir Hasan', age: 27);
  debugPrint(person.name);
}

class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});
}
