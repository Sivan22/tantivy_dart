import 'package:flutter/widgets.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tantivy_dart/tantivy_dart.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async => await RustLib.init());
  test('test schema builder', () async {
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
    schemaBuilder.addFacetField(name: "category");
    final schema = schemaBuilder.build();

    debugPrint(schema.toString());
  });
}
