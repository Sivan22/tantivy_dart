# tantivy_dart

Dart bindings for tantivy - full text search library written in rust.

## Usage

```dart
import 'package:tantivy_dart/tantivy_dart.dart';

 final schemaBuilder = SchemaBuilder();

    schemaBuilder.addTextField(
      name: "title",
      stored: true,
      fast: true,
      tokenizerName: "default",
      indexOption: "position",
    );
    schemaBuilder.addIntegerField(
      name: "price",
      stored: true,
      fast: false,
      indexed: true,
    );
    final schema = schemaBuilder.build();

    final doc = Document({"title": "Hello world", "price": 10}, schema);

```

## Bridge

this package is a is using the [Flutter Rust Bridge](https://github.com/fzyzcjy/flutter_rust_bridge) to bridge between rust and dart.