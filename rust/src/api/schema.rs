pub use tantivy as tv;
pub use tantivy::schema::Schema as tv_schema;


#[derive(Clone)]
pub(crate) enum FieldType {
    Text,
    Unsigned,
    Integer,
    Float,
    Boolean,
    Date,
    Facet,
    Bytes,
    Json,
    IpAddr,
}

impl From<FieldType> for tv::schema::Type {
    fn from(field_type: FieldType) -> tv::schema::Type {
        match field_type {
            FieldType::Text => tv::schema::Type::Str,
            FieldType::Unsigned => tv::schema::Type::U64,
            FieldType::Integer => tv::schema::Type::I64,
            FieldType::Float => tv::schema::Type::F64,
            FieldType::Boolean => tv::schema::Type::Str,
            FieldType::Date => tv::schema::Type::Date,
            FieldType::Facet => tv::schema::Type::Facet,
            FieldType::Bytes => tv::schema::Type::Bytes,
            FieldType::Json => tv::schema::Type::Json,
            FieldType::IpAddr => tv::schema::Type::IpAddr,
        }
    }
}

/// Tantivy schema.
///
/// The schema is very strict. To build the schema the `SchemaBuilder` class is
/// provided.


pub struct Schema {
    pub(crate) inner: tv_schema,
}

impl  Schema {
    pub fn get_field(&self, name: &str) -> Result<tv::schema::Field, tv::TantivyError> {
        self.inner.get_field(name)
    }
    
}

