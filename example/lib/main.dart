import 'package:flutter/material.dart';
import 'package:tantivy_dart/tantivy_dart.dart';

Future<void> main() async {
  await RustLib.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(child: Text('A`')),
      ),
    );
  }
}
