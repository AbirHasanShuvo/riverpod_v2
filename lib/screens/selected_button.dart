import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isRedProvider = Provider<bool>((ref) {
  final color = ref.watch(selectedButtonProvider);
  return color == 'red';
});
final selectedButtonProvider = StateProvider<String>((ref) => '');

class SelectedButton extends ConsumerWidget {
  const SelectedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRed = ref.watch(isRedProvider);
    final selectedButton = ref.watch(selectedButtonProvider);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selected Button: $selectedButton",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  ref.read(selectedButtonProvider.notifier).state = 'Red',
              child: Text("Red"),
            ),
            ElevatedButton(
              onPressed: () =>
                  ref.read(selectedButtonProvider.notifier).state = "Blue",
              child: Text("Blue"),
            ),
            ElevatedButton(
              onPressed: () =>
                  ref.read(selectedButtonProvider.notifier).state = 'Green',
              child: Text("Green"),
            ),

            const SizedBox(height: 20),

            isRed ? Text("the color is red") : Text("the color is blue"),
          ],
        ),
      ),
    );
  }
}
