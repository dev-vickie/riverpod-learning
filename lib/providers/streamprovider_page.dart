import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider.autoDispose<String>(
  (ref) => Stream.periodic(
    const Duration(seconds: 1),
    (count) => '$count',
  ),
);

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final stream = ref.watch(streamProvider);
            return stream.when(
              data: (data) => Text(data),
              error: (error, stackTrace) => Text('Something Occured $error'),
              loading: () => const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

Widget simplerStreamBuilder(ref) {
  final stream = ref.watch(streamProvider.stream);

  return stream.when(
      data: (value) => Text(value),
      loading: () => const CircularProgressIndicator(),
      error: (e, stack) => Text('Something occured $e'));
}

Widget buildStreamBuilder(ref) {
  final stream = ref.watch(streamProvider.stream);
  return StreamBuilder<String>(
    stream: stream,
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case (ConnectionState.waiting):
          return const CircularProgressIndicator();
        default:
          if (snapshot.hasError) {
            return const Text('Something occured');
          } else {
            final counter = snapshot.data;
            return Text(counter.toString());
          }
      }
    },
  );
}
