import 'package:flutter/widgets.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tantivy_dart/tantivy_dart.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async => await RustLib.init());
  test('Can call rust function', () async {
    final schemaBuilder = SchemaBuilder();
    schemaBuilder.addTextField(
      name: "title",
      stored: true,
      fast: false,
      indexOption: "positions",
      tokenizerName: "default",
    );
    schemaBuilder.addIntegerField(
      name: "price",
      stored: true,
      fast: false,
      indexed: true,
    );
    final schema = schemaBuilder.build();

    debugPrint(schema.toString());
  });
}
