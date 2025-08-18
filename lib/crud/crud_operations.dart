import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numbersProvier = StateNotifierProvider<NumberNotifier, List<String>>((
  ref,
) {
  return NumberNotifier();
});

class NumberNotifier extends StateNotifier<List<String>> {
  NumberNotifier() : super(['number 12', 'number 13']);
  void add(String number) {
    state = [...state, number];
  }

  void remove(String number) {
    state = [...state.where((element) => element != number)];
  }

  void update(String number, String updatedNumber) {
    final updatedList = <String>[];
    for (var i = 0; i < state.length; i++) {
      if (state[i] == number) {
        updatedList.add(updatedNumber);
      } else {
        updatedList.add(state[i]);
      }
    }
    state = updatedList;
  }
}

class CrudOperations extends ConsumerWidget {
  const CrudOperations({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numbers = ref.watch(numbersProvier);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(numbersProvier.notifier)
              .add('number ${Random().nextInt(100)}');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          'Riverpod',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Center(
        child: Column(
          children: numbers
              .map(
                (e) => GestureDetector(
                  onLongPress: () {
                    ref
                        .read(numbersProvier.notifier)
                        .update(e, '$e ${Random().nextInt(1000)}');
                  },
                  onTap: () {
                    ref.read(numbersProvier.notifier).remove(e);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(e),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
