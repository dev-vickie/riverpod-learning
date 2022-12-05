import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = StateProvider<int>((ref) => 0);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var number = ref.watch(numberProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('State Provider Page'),
      ),
      body: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(
            fontSize: 50,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(numberProvider.notifier).state++;
        },
      ),
    );
  }
}
