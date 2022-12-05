import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = Provider.autoDispose<int>(((ref) => 50));

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Consumer(
        builder: (context, ref, child) {
          final number = ref.watch(numberProvider);
          return Text(
            number.toString(),
          );
        },
      )),
    );
  }
}
