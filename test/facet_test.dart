import 'package:flutter/widgets.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tantivy_dart/tantivy_dart.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async => await RustLib.init());
  test('Facet test', () async {
    final facet = Facet.fromString(facetString: "/color/yellow");

    expect(facet.toPathStr(), "/color/yellow");
    expect(facet.toPath(), ["color", "yellow"]);

    expect(facet.isRoot(), false);
    expect(
      facet.isPrefixOf(
        other: Facet.fromString(facetString: "/color/yellow/green"),
      ),
      true,
    );
    expect(
      Facet.root().isPrefixOf(
        other: Facet.fromString(facetString: "/color/green"),
      ),
      true,
    );
  });
}
