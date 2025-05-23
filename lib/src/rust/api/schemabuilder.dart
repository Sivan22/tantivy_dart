// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.9.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'schema.dart';

// These functions are ignored because they are not marked as `pub`: `build_numeric_option`, `build_text_option`
// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `clone`

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<SchemaBuilder>>
abstract class SchemaBuilder implements RustOpaqueInterface {
  /// Add a new boolean field to the schema.
  ///
  /// Args:
  ///     name (str): The name of the field.
  ///     stored (bool, optional): If true sets the field as stored, the
  ///         content of the field can be later restored from a Searcher.
  ///         Defaults to False.
  ///     indexed (bool, optional): If true sets the field to be indexed.
  ///     fast (bool, optional): Set the numeric options as a fast field. A
  ///         fast field is a column-oriented fashion storage for tantivy.
  ///         It is designed for the fast random access of some document
  ///         fields given a document id.
  ///
  /// Returns the associated field handle.
  /// Raises a ValueError if there was an error with the field creation.
  SchemaBuilder addBooleanField({
    required String name,
    required bool stored,
    required bool indexed,
    required bool fast,
  });

  /// Add a fast bytes field to the schema.
  ///
  /// Args:
  ///     name (str): The name of the field.
  ///     stored (bool, optional): If true sets the field as stored, the
  ///         content of the field can be later restored from a Searcher.
  ///         Defaults to False.
  ///     indexed (bool, optional): If true sets the field to be indexed.
  ///     fast (bool, optional): Set the bytes options as a fast field. A fast
  ///         field is a column-oriented fashion storage for tantivy. It is
  ///         designed for the fast random access of some document fields
  ///         given a document id.
  SchemaBuilder addBytesField({
    required String name,
    required bool stored,
    required bool indexed,
    required bool fast,
  });

  /// Add a new date field to the schema.
  ///
  /// Args:
  ///     name (str): The name of the field.
  ///     stored (bool, optional): If true sets the field as stored, the
  ///         content of the field can be later restored from a Searcher.
  ///         Defaults to False.
  ///     indexed (bool, optional): If true sets the field to be indexed.
  ///     fast (bool, optional): Set the date options as a fast field. A fast
  ///         field is a column-oriented fashion storage for tantivy. It is
  ///         designed for the fast random access of some document fields
  ///         given a document id.
  ///
  /// Returns the associated field handle.
  /// Raises a ValueError if there was an error with the field creation.
  SchemaBuilder addDateField({
    required String name,
    required bool stored,
    required bool indexed,
    required bool fast,
  });

  /// Add a Facet field to the schema.
  /// Args:
  ///     name (str): The name of the field.
  SchemaBuilder addFacetField({required String name});

  /// Add a new float field to the schema.
  ///
  /// Args:
  ///     name (str): The name of the field.
  ///     stored (bool, optional): If true sets the field as stored, the
  ///         content of the field can be later restored from a Searcher.
  ///         Defaults to False.
  ///     indexed (bool, optional): If true sets the field to be indexed.
  ///     fast (bool, optional): Set the numeric options as a fast field. A
  ///         fast field is a column-oriented fashion storage for tantivy.
  ///         It is designed for the fast random access of some document
  ///         fields given a document id.
  ///
  /// Returns the associated field handle.
  /// Raises a ValueError if there was an error with the field creation.
  SchemaBuilder addFloatField({
    required String name,
    required bool stored,
    required bool indexed,
    required bool fast,
  });

  /// Add a new signed integer field to the schema.
  ///
  /// Args:
  ///     name (str): The name of the field.
  ///     stored (bool, optional): If true sets the field as stored, the
  ///         content of the field can be later restored from a Searcher.
  ///         Defaults to False.
  ///     indexed (bool, optional): If true sets the field to be indexed.
  ///     fast (bool, optional): Set the numeric options as a fast field. A
  ///         fast field is a column-oriented fashion storage for tantivy.
  ///         It is designed for the fast random access of some document
  ///         fields given a document id.
  ///
  /// Returns the associated field handle.
  /// Raises a ValueError if there was an error with the field creation.
  SchemaBuilder addIntegerField({
    required String name,
    required bool stored,
    required bool indexed,
    required bool fast,
  });

  /// Add an IP address field to the schema.
  ///
  /// Args:
  ///     name (str): The name of the field.
  ///     stored (bool, optional): If true sets the field as stored, the
  ///         content of the field can be later restored from a Searcher.
  ///         Defaults to False.
  ///     indexed (bool, optional): If true sets the field to be indexed.
  ///     fast (bool, optional): Set the IP address options as a fast field. A
  ///         fast field is a column-oriented fashion storage for tantivy. It
  ///         is designed for the fast random access of some document fields
  ///         given a document id.
  SchemaBuilder addIpAddrField({
    required String name,
    required bool stored,
    required bool indexed,
    required bool fast,
  });

  /// Add a new json field to the schema.
  ///
  /// Args:
  ///     name (str): the name of the field.
  ///     stored (bool, optional): If true sets the field as stored, the
  ///         content of the field can be later restored from a Searcher.
  ///         Defaults to False.
  ///     fast (bool, optional): Set the text options as a fast field. A
  ///         fast field is a column-oriented fashion storage for tantivy.
  ///         Text fast fields will have the term ids stored in the fast
  ///         field. The fast field will be a multivalued fast field.
  ///         It is recommended to use the "raw" tokenizer, since it will
  ///         store the original text unchanged. The "default" tokenizer will
  ///         store the terms as lower case and this will be reflected in the
  ///         dictionary.
  ///     tokenizer_name (str, optional): The name of the tokenizer that
  ///         should be used to process the field. Defaults to 'default'
  ///     index_option (str, optional): Sets which information should be
  ///         indexed with the tokens. Can be one of 'position', 'freq' or
  ///         'basic'. Defaults to 'position'. The 'basic' index_option
  ///         records only the document ID, the 'freq' option records the
  ///         document id and the term frequency, while the 'position' option
  ///         records the document id, term frequency and the positions of
  ///         the term occurrences in the document.
  ///
  /// Returns the associated field handle.
  /// Raises a ValueError if there was an error with the field creation.
  SchemaBuilder addJsonField({
    required String name,
    required bool stored,
    required bool fast,
    required String tokenizerName,
    required String indexOption,
  });

  /// Add a new text field to the schema.
  ///
  /// Args:
  ///     name (str): The name of the field.
  ///     stored (bool, optional): If true sets the field as stored, the
  ///         content of the field can be later restored from a Searcher.
  ///         Defaults to False.
  ///     fast (bool, optional): Set the text options as a fast field. A
  ///         fast field is a column-oriented fashion storage for tantivy.
  ///         Text fast fields will have the term ids stored in the fast
  ///         field. The fast field will be a multivalued fast field.
  ///         It is recommended to use the "raw" tokenizer, since it will
  ///         store the original text unchanged. The "default" tokenizer will
  ///         store the terms as lower case and this will be reflected in the
  ///         dictionary.
  ///     tokenizer_name (str, optional): The name of the tokenizer that
  ///         should be used to process the field. Defaults to 'default'
  ///     index_option (str, optional): Sets which information should be
  ///         indexed with the tokens. Can be one of 'position', 'freq' or
  ///         'basic'. Defaults to 'position'. The 'basic' index_option
  ///         records only the document ID, the 'freq' option records the
  ///         document id and the term frequency, while the 'position' option
  ///         records the document id, term frequency and the positions of
  ///         the term occurrences in the document.
  ///
  /// Returns the associated field handle.
  /// Raises a ValueError if there was an error with the field creation.
  SchemaBuilder addTextField({
    required String name,
    required bool stored,
    required bool fast,
    required String tokenizerName,
    required String indexOption,
  });

  /// Add a new unsigned integer field to the schema.
  ///
  /// Args:
  ///     name (str): The name of the field.
  ///     stored (bool, optional): If true sets the field as stored, the
  ///         content of the field can be later restored from a Searcher.
  ///         Defaults to False.
  ///     indexed (bool, optional): If true sets the field to be indexed.
  ///     fast (bool, optional): Set the numeric options as a fast field. A
  ///         fast field is a column-oriented fashion storage for tantivy.
  ///         It is designed for the fast random access of some document
  ///         fields given a document id.
  ///
  /// Returns the associated field handle.
  /// Raises a ValueError if there was an error with the field creation.
  SchemaBuilder addUnsignedField({
    required String name,
    required bool stored,
    required bool indexed,
    required bool fast,
  });

  /// Finalize the creation of a Schema.
  ///
  /// Returns a Schema object. After this is called the SchemaBuilder cannot
  /// be used anymore.
  ///
  Schema build();

  static bool isValidFieldName({required String name}) => RustLib.instance.api
      .crateApiSchemabuilderSchemaBuilderIsValidFieldName(name: name);

  factory SchemaBuilder() =>
      RustLib.instance.api.crateApiSchemabuilderSchemaBuilderNew();
}
