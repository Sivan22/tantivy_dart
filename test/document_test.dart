import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tantivy_dart/tantivy_dart.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async => await RustLib.init());
  test('Document test', () async {
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
  });
}
