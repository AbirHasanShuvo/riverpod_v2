import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v2/main.dart';

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                ref.read(counterStateProvider.notifier).state++;
              },
              child: Icon(Icons.add),
            ),

            const Spacer(),

            FloatingActionButton(
              onPressed: () {
                ref.read(counterStateProvider.notifier).state--;
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
      body: Center(child: Text("value : $value")),
    );
  }
}
