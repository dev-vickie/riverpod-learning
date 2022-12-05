import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>((ref) => fetchWeather());

Future<int> fetchWeather() async {
  await Future.delayed(
    const Duration(seconds: 2),
  );
  return 20;
}

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
        centerTitle: true,
      ),
      body: Center(
        child: response.when(
          data: (data) => Text(response.toString()),
          error: (error, stackTrace) => const Text('Something occured $e'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
