import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v2/crud/crud_operations.dart';
import 'package:riverpod_v2/home/home_page.dart';
import 'package:riverpod_v2/selected_button/selected_button.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CrudOperations(),
    );
  }
}

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

//for basic operations call the class named MyHomePage
//for http get data call the class named HomePage
//for basic state changing operation called the class named SelectedButton
