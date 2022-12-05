import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod1_jm/providers/provider_page.dart';
import 'package:riverpod1_jm/providers/streamprovider_page.dart';
import 'providers/futureprovider_page.dart';
import 'providers/stateprovider_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('riverpod'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            RiverpodItem(
              pageToNavigateTo: ProviderPage(),
              providerName: 'Provider Page',
            ),
            RiverpodItem(
              pageToNavigateTo: StateProviderPage(),
              providerName: 'State Provider',
            ),
            RiverpodItem(
              pageToNavigateTo: FutureProviderPage(),
              providerName: 'Future Provider',
            ),
            RiverpodItem(
              pageToNavigateTo: StreamProviderPage(),
              providerName: 'Stream Provider',
            )
          ],
        ),
      ),
    );
  }
}

class RiverpodItem extends StatelessWidget {
  final String providerName;
  final Widget pageToNavigateTo;
  const RiverpodItem(
      {super.key, required this.pageToNavigateTo, required this.providerName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => pageToNavigateTo,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Text(
          providerName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        )),
      ),
    );
  }
}
